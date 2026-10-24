"""Run KICS 2.1.20 offline on the 669 templates and write kics_labels.csv (used in Studies 3 and 4).
Run from the data/ folder after fetch_templates.py:   python ../scripts/run_kics.py
Downloads the KICS v2.1.20 linux_amd64 release and the v2.1.20 source tarball (for the query set) from GitHub.
Label definition (fixed before comparison with any human label): kics_high = at least one HIGH or CRITICAL finding; kics_all = any finding."""
import argparse, collections, json, os, subprocess, tarfile, urllib.request
import pandas as pd
UA = {'User-Agent': 'Mozilla/5.0'}
def get(url, out):
    if not os.path.exists(out): open(out, 'wb').write(urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=300).read())
ap = argparse.ArgumentParser(); ap.add_argument('--parse-only', action='store_true'); a = ap.parse_args(); W = 'kics_work'; os.makedirs(W, exist_ok=True)
if not a.parse_only:
    get('https://github.com/Checkmarx/kics/releases/download/v2.1.20/kics_2.1.20_linux_amd64.tar.gz', f'{W}/kics.tgz'); tarfile.open(f'{W}/kics.tgz').extractall(W)
    get('https://codeload.github.com/Checkmarx/kics/tar.gz/refs/tags/v2.1.20', f'{W}/src.tgz')
    with tarfile.open(f'{W}/src.tgz') as t: t.extractall(f'{W}/src', members=[m for m in t.getmembers() if '/assets/queries/cloudFormation/' in m.name or '/assets/libraries/' in m.name or '/assets/queries/common/' in m.name])
    root = f'{W}/src/kics-2.1.20/assets'; os.chmod(f'{W}/kics', 0o755)
    subprocess.run([f'{W}/kics', 'scan', '-p', 'raw/raw', '-q', f'{root}/queries', '-l', f'{root}/libraries', '-t', 'CloudFormation', '-o', f'{W}/out', '--report-formats', 'json', '--no-progress', '--disable-full-descriptions', '-s'])   # exit code 60 means "findings found"
r = json.load(open(f'{W}/out/results.json')); per = collections.defaultdict(lambda: {'n': 0, 'high': set()})
for q in r['queries']:
    for f in q['files']:
        fid = os.path.basename(f['file_name']).split('.')[0]; per[fid]['n'] += 1
        if q['severity'] in ('HIGH', 'CRITICAL'): per[fid]['high'].add(q['query_id'])
L = pd.read_csv('labels.csv'); out = pd.DataFrame({'file_id': L.file_id})
out['kics_all'] = out.file_id.map(lambda i: int(i in per)); out['kics_high'] = out.file_id.map(lambda i: int(i in per and len(per[i]['high']) > 0)); out['kics_n_findings'] = out.file_id.map(lambda i: per[i]['n'] if i in per else 0)
out.to_csv('kics_labels.csv', index=False); print(f'{len(out)} templates; any finding {out.kics_all.sum()}; HIGH/CRITICAL {out.kics_high.sum()}')
