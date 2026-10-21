"""Re-fetch the 669 template files of Study 3 from GitHub at the recorded commits and verify them.

Run from the data/ folder:   python ../scripts/fetch_templates.py [--workers 16]
Writes data/raw/raw/<file_id>.yaml. The SHA-256 in metadata.csv is computed on the file content with all
whitespace removed, so that is how each download is checked. Files that no longer exist or that differ are
reported at the end; the template contents themselves are not part of this repository (mixed licenses).
"""
import argparse, hashlib, os, re, sys, time, urllib.parse, urllib.request
from concurrent.futures import ThreadPoolExecutor
import pandas as pd

def digest(b): return hashlib.sha256(re.sub(rb'\s+', b'', b)).hexdigest()

def fetch(row):
    out = f'raw/raw/{row.file_id}.yaml'
    if os.path.exists(out) and digest(open(out, 'rb').read()) == row.sha256: return row.file_id, 'ok (cached)'
    url = f'https://raw.githubusercontent.com/{row.repo}/{row.commit}/{urllib.parse.quote(row.path)}'
    for attempt in range(3):
        try:
            b = urllib.request.urlopen(url, timeout=30).read()
            if digest(b) != row.sha256: return row.file_id, 'HASH MISMATCH'
            open(out, 'wb').write(b); return row.file_id, 'ok'
        except Exception as e:
            err = repr(e)[:80]; time.sleep(1 + attempt)
    return row.file_id, 'FAILED ' + err

if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('--workers', type=int, default=8); ap.add_argument('--limit', type=int, default=None)
    a = ap.parse_args(); m = pd.read_csv('metadata.csv')
    if a.limit: m = m.head(a.limit)
    os.makedirs('raw/raw', exist_ok=True)
    with ThreadPoolExecutor(a.workers) as ex: res = list(ex.map(fetch, m.itertuples()))
    bad = [r for r in res if not r[1].startswith('ok')]
    print(f'{len(res) - len(bad)} of {len(res)} templates fetched and verified'); [print(' ', *r) for r in bad]
    sys.exit(1 if bad else 0)
