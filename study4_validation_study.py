"""Study 4: expert-labelled validation subset. Reproducible analysis.

Inputs (same folder): consolidated_200_provisional_labels.csv, reviewer2_blinded_sheet.csv,
labels.csv, metadata.csv, raw/raw/<file_id>.yaml  (corpus files from Study 3)
Usage: python3 validation_study.py <part>     part in {reliability, scanners, ml_primary, ml_sens, ml_transfer}
"""
import sys, re, json, numpy as np, pandas as pd, warnings
from math import sqrt
from sklearn.metrics import cohen_kappa_score, roc_auc_score, average_precision_score
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
warnings.filterwarnings('ignore')
CORPUS = '.'                              # folder with labels.csv, metadata.csv, raw/raw/
ALLOW = {'CKV_AWS_107', 'CKV_AWS_108', 'CKV_AWS_109', 'CKV_AWS_110', 'CKV_AWS_111', 'CKV_AWS_40', 'CKV_AWS_60', 'CKV_AWS_258'}
CATS = ['misconfigured', 'no_confirmed_misconfiguration', 'uncertain']

def load():
    c = pd.read_csv('consolidated_200_provisional_labels.csv'); b = pd.read_csv('reviewer2_blinded_sheet.csv')
    L = pd.read_csv(f'{CORPUS}/labels.csv'); M = pd.read_csv(f'{CORPUS}/metadata.csv')
    ids = lambda s: set(re.split(r'[;,\s]+', str(s))) - {'', 'nan'}
    L['checkov_sec'] = L.checkov_ids.apply(lambda s: int(len(ids(s) & ALLOW) > 0))
    restr = lambda s: any(x.startswith(('IAM', 'CROSS')) or x in ('API_FUNCTION_URL_NO_AUTH', 'API_LAMBDA_PERMISSION_OPEN') for x in str(s).split(';')) if pd.notna(s) else False
    L['custom_restr'] = L.custom_codes.apply(lambda s: int(restr(s)))
    cell = L[L.label_checkov.notna()].groupby(['label_custom', 'label_checkov']).size()
    d = c.merge(b[['file_id', 'label']].rename(columns={'label': 'label_r2_pass1'}), on='file_id')
    d = d.merge(L[['file_id', 'label_custom', 'label_checkov', 'checkov_sec', 'custom_restr', 'n_resources', 'near_dup_signature']], on='file_id').merge(M[['file_id', 'size_bytes']], on='file_id')
    d['w'] = d.apply(lambda r: cell[(r.label_custom, r.label_checkov)] / 50.0, axis=1)
    d['text'] = d.file_id.map(lambda i: open(f'{CORPUS}/raw/raw/{i}.yaml', encoding='utf-8', errors='replace').read())
    d['n_lines'] = d.text.str.count('\n') + 1
    return d, L, cell

def wilson(k, n, z=1.96):
    if n == 0: return (np.nan, np.nan)
    p = k / n; dd = 1 + z * z / n; cc = p + z * z / (2 * n); h = z * sqrt(p * (1 - p) / n + z * z / (4 * n * n)); return (100 * (cc - h) / dd, 100 * (cc + h) / dd)
def cm(y, p, w=None):
    w = np.ones(len(y)) if w is None else w
    return (w[(y == 1) & (p == 1)].sum(), w[(y == 0) & (p == 1)].sum(), w[(y == 1) & (p == 0)].sum(), w[(y == 0) & (p == 0)].sum())
def m_all(y, p, w=None):
    tp, fp, fn, tn = cm(y, p, w); n = tp + fp + fn + tn
    sens = tp / (tp + fn) if tp + fn else np.nan; spec = tn / (tn + fp) if tn + fp else np.nan; prec = tp / (tp + fp) if tp + fp else np.nan
    f1 = 2 * tp / (2 * tp + fp + fn) if (2 * tp + fp + fn) else np.nan
    return dict(acc=100 * (tp + tn) / n, bal=50 * (sens + spec), sens=100 * sens, spec=100 * spec, prec=100 * prec, f1=100 * f1, prev=100 * (tp + fn) / n)
def mk_y(d, col): 
    k = d[d[col] != 'uncertain']; return k, (k[col] == 'misconfigured').astype(int).values

def reliability():
    d, L, cell = load(); out = {}
    for name, a, b in (('pass2_used_for_adjudication', 'label_r1', 'label_r2'), ('pass1_blinded_sheet', 'label_r1', 'label_r2_pass1')):
        tab = pd.crosstab(d[a], d[b]).reindex(index=CATS, columns=CATS, fill_value=0); agree = int((d[a] == d[b]).sum())
        k = d[(d[a] != 'uncertain') & (d[b] != 'uncertain')]; ya = (k[a] == 'misconfigured').astype(int); yb = (k[b] == 'misconfigured').astype(int)
        A = int(((ya == 1) & (yb == 1)).sum()); B = int(((ya == 1) & (yb == 0)).sum()); C = int(((ya == 0) & (yb == 1)).sum()); D = int(((ya == 0) & (yb == 0)).sum())
        out[name] = dict(agree=agree, disagree=200 - agree, kappa3=cohen_kappa_score(d[a], d[b]), n_binary=len(k), kappa_bin=cohen_kappa_score(ya, yb),
                         pos_agree=2 * A / (2 * A + B + C), neg_agree=2 * D / (2 * D + B + C), pabak=2 * ((A + D) / len(k)) - 1,
                         unc_r1=int((d[a] == 'uncertain').sum()), unc_r2=int((d[b] == 'uncertain').sum()), crosstab=tab.values.tolist())
    out['r2_versions_identical'] = int((d.label_r2 == d.label_r2_pass1).sum())
    out['r2_versions_crosstab'] = pd.crosstab(d.label_r2_pass1, d.label_r2).reindex(index=CATS, columns=CATS, fill_value=0).values.tolist()
    adj = d[~d.reviewers_agree]
    out['adjudication'] = dict(n_adjudicated=len(adj), labels=adj.user_checked_label.value_counts().to_dict(), final=d.final_working_label.value_counts().to_dict(),
        final_pos_agreed=int(((d.final_working_label == 'misconfigured') & d.reviewers_agree).sum()), final_pos_adjudicated=int(((d.final_working_label == 'misconfigured') & ~d.reviewers_agree).sum()),
        eq_r1=int((adj.user_checked_label == adj.label_r1).sum()), eq_r2=int((adj.user_checked_label == adj.label_r2).sum()),
        eq_neither=int(((adj.user_checked_label != adj.label_r1) & (adj.user_checked_label != adj.label_r2)).sum()))
    out['sampling'] = dict(cells={str(k): int(v) for k, v in cell.items()}, weights={str(k): round(v / 50, 2) for k, v in cell.items()}, repos=int(d.repo.nunique()), max_per_repo=int(d.repo.value_counts().max()))
    out['r2_pass2_unique_evidence'] = int(d.evidence_r2.nunique()); out['r2_pass2_second_pass_prefix'] = int(d.evidence_r2.str.startswith('Second-pass review').sum())
    out['r2_pass1_unique_evidence'] = int(pd.read_csv('reviewer2_blinded_sheet.csv').evidence.nunique())
    json.dump(out, open('reliability.json', 'w'), indent=1, default=float); print(json.dumps(out, indent=1, default=float)[:3000])

def scanner_preds(k):
    return {'Custom rules (all 14)': k.label_custom.values, 'Custom rules (IAM, function-URL, permission, cross-resource)': k.custom_restr.values,
            'Checkov (default scope)': k.label_checkov.astype(int).values, 'Checkov (security-only allow-list)': k.checkov_sec.values,
            'Always flag': np.ones(len(k), int), 'Never flag': np.zeros(len(k), int)}

def scanners():
    d, L, cell = load(); rng = np.random.RandomState(5); rows = []
    refs = {'Adjudicated (primary)': 'final_working_label', 'Annotator 1 only': 'label_r1', 'Annotator 2, pass 2': 'label_r2', 'Annotator 2, pass 1 (blinded sheet)': 'label_r2_pass1'}
    d['agreed_label'] = np.where(d.reviewers_agree, d.label_r1, 'uncertain'); refs['Cases both annotators agreed on'] = 'agreed_label'
    d['adj_only_label'] = np.where(~d.reviewers_agree, d.user_checked_label.fillna('uncertain'), 'uncertain'); refs['Adjudicated cases only'] = 'adj_only_label'
    for rname, col in refs.items():
        k, y = mk_y(d, col)
        for name, p in scanner_preds(k).items():
            tp, fp, fn, tn = cm(y, p); u = m_all(y, p); wv = m_all(y, p, k.w.values)
            bal_b, f1_b = [], []
            for _ in range(2000):
                ix = rng.randint(0, len(y), len(y)); mm = m_all(y[ix], p[ix]); bal_b.append(mm['bal']); f1_b.append(mm['f1'])
            rows.append(dict(reference=rname, method=name, n=len(y), pos=int(y.sum()), TP=int(tp), FP=int(fp), FN=int(fn), TN=int(tn), **{k_: v for k_, v in u.items()},
                             sens_lo=wilson(tp, tp + fn)[0], sens_hi=wilson(tp, tp + fn)[1], spec_lo=wilson(tn, tn + fp)[0], spec_hi=wilson(tn, tn + fp)[1],
                             prec_lo=wilson(tp, tp + fp)[0] if tp + fp else np.nan, prec_hi=wilson(tp, tp + fp)[1] if tp + fp else np.nan,
                             acc_lo=wilson(tp + tn, len(y))[0], acc_hi=wilson(tp + tn, len(y))[1],
                             bal_lo=np.nanpercentile(bal_b, 2.5), bal_hi=np.nanpercentile(bal_b, 97.5), f1_lo=np.nanpercentile(f1_b, 2.5), f1_hi=np.nanpercentile(f1_b, 97.5),
                             w_bal=wv['bal'], w_sens=wv['sens'], w_spec=wv['spec'], w_prec=wv['prec'], w_prev=wv['prev']))
    R = pd.DataFrame(rows); R.to_csv('scanner_results.csv', index=False)
    # paired contrasts on the adjudicated labels
    k, y = mk_y(d, 'final_working_label'); P = scanner_preds(k); con = []
    for a, b in (('Custom rules (all 14)', 'Checkov (default scope)'), ('Custom rules (IAM, function-URL, permission, cross-resource)', 'Checkov (security-only allow-list)'),
                 ('Custom rules (IAM, function-URL, permission, cross-resource)', 'Custom rules (all 14)')):
        diff = []
        for _ in range(4000):
            ix = rng.randint(0, len(y), len(y)); diff.append(m_all(y[ix], P[a][ix])['bal'] - m_all(y[ix], P[b][ix])['bal'])
        con.append(dict(a=a, b=b, diff=m_all(y, P[a])['bal'] - m_all(y, P[b])['bal'], lo=np.percentile(diff, 2.5), hi=np.percentile(diff, 97.5)))
    pd.DataFrame(con).to_csv('scanner_contrasts.csv', index=False)
    print(R[R.reference == 'Adjudicated (primary)'].round(1).to_string(index=False)); print(pd.DataFrame(con).round(1).to_string(index=False))

def feats(d):
    return np.column_stack([np.log1p(d.size_bytes), np.log1p(d.n_lines), np.log1p(d.n_resources)])
def vec(): return TfidfVectorizer(ngram_range=(1, 2), max_features=8000, min_df=2, sublinear_tf=True)
def lr(): return LogisticRegression(class_weight='balanced', solver='liblinear', max_iter=500)

def oof_scores(k, y, rng):
    """one repeat: repo-grouped 5-fold; each template is scored by models that never saw its repository"""
    groups = k.repo.values; ug = np.unique(groups); perm = rng.permutation(len(ug)); fo = {g: i % 5 for i, g in enumerate(ug[perm])}
    fold = np.array([fo[g] for g in groups]); st = np.full(len(y), np.nan); sm = np.full(len(y), np.nan); X = feats(k)
    for f in range(5):
        tr, te = fold != f, fold == f
        v = vec().fit(k.text[tr]); st[te] = lr().fit(v.transform(k.text[tr]), y[tr]).decision_function(v.transform(k.text[te]))
        sm[te] = make_pipeline(StandardScaler(), LogisticRegression(class_weight='balanced', max_iter=500)).fit(X[tr], y[tr]).decision_function(X[te])
    return st, sm

def ml(col, n_rep, tag):
    d, L, cell = load(); rng = np.random.RandomState(20261021); k, y = mk_y(d, col); k = k.reset_index(drop=True)
    S = {'Text model (TF-IDF + logistic regression)': [], 'Size/metadata-only model': []}; rows = []
    for r in range(n_rep):
        st, sm = oof_scores(k, y, rng); S['Text model (TF-IDF + logistic regression)'].append(st); S['Size/metadata-only model'].append(sm)
    np.save(f'oof_{tag}_text.npy', np.array(S['Text model (TF-IDF + logistic regression)'])); np.save(f'oof_{tag}_meta.npy', np.array(S['Size/metadata-only model']))
    rng = np.random.RandomState(99)
    for name, sc in S.items():
        sc = np.array(sc); per = [m_all(y, (s > 0).astype(int)) for s in sc]; perw = [m_all(y, (s > 0).astype(int), k.w.values) for s in sc]
        aucs = [roc_auc_score(y, s) * 100 for s in sc]; aps = [average_precision_score(y, s) * 100 for s in sc]
        bs = {m: [] for m in ('acc', 'bal', 'sens', 'spec', 'prec', 'f1')}; bsa = []
        for s in sc:      # one template-bootstrap draw per repeat: interval reflects both the CV split and the sample
            ix = rng.randint(0, len(y), len(y))
            if y[ix].sum() == 0: continue
            mm = m_all(y[ix], (s[ix] > 0).astype(int))
            for m in bs: bs[m].append(mm[m])
            bsa.append(roc_auc_score(y[ix], s[ix]) * 100)
        mean = {m: np.nanmean([p[m] for p in per]) for m in bs}
        row = dict(reference=col, method=name, n=len(y), pos=int(y.sum()), repeats=n_rep, **mean, auc=np.mean(aucs), ap=np.mean(aps), w_bal=np.nanmean([p['bal'] for p in perw]))
        for m in bs: row[m + '_lo'] = np.nanpercentile(bs[m], 2.5); row[m + '_hi'] = np.nanpercentile(bs[m], 97.5)
        row['auc_lo'] = np.nanpercentile(bsa, 2.5); row['auc_hi'] = np.nanpercentile(bsa, 97.5); rows.append(row)
    R = pd.DataFrame(rows); R.to_csv(f'ml_{tag}.csv', index=False); print(R.round(1).to_string(index=False))

def ml_contrasts():
    d, L, cell = load(); k, y = mk_y(d, 'final_working_label'); rng = np.random.RandomState(8); P = scanner_preds(k)
    T = np.load('oof_primary_text.npy'); Mm = np.load('oof_primary_meta.npy'); rows = []
    bal = lambda yy, pp: m_all(yy, pp)['bal']
    for nm, other in (('Custom rules (all 14)', P['Custom rules (all 14)']), ('Custom rules (IAM, function-URL, permission, cross-resource)', P['Custom rules (IAM, function-URL, permission, cross-resource)']),
                      ('Checkov (default scope)', P['Checkov (default scope)']), ('Checkov (security-only allow-list)', P['Checkov (security-only allow-list)']), ('Size/metadata-only model', None)):
        diff = []
        for _ in range(4000):
            ix = rng.randint(0, len(y), len(y)); r = rng.randint(0, T.shape[0])
            o = (Mm[r][ix] > 0).astype(int) if other is None else other[ix]
            if y[ix].sum() == 0: continue
            diff.append(bal(y[ix], (T[r][ix] > 0).astype(int)) - bal(y[ix], o))
        pt = np.mean([bal(y, (T[r] > 0).astype(int)) - bal(y, ((Mm[r] > 0).astype(int) if other is None else other)) for r in range(T.shape[0])])
        rows.append(dict(text_model_minus=nm, diff_bal=pt, lo=np.percentile(diff, 2.5), hi=np.percentile(diff, 97.5)))
    R = pd.DataFrame(rows); R.to_csv('ml_contrasts.csv', index=False); print(R.round(1).to_string(index=False))

def transfer():
    """Protocol B: train on scanner labels of corpus templates sharing no repository or near-duplicate group with the 200 sampled; test on human labels."""
    d, L, cell = load(); L = L.copy(); L['text'] = L.file_id.map(lambda i: open(f'{CORPUS}/raw/raw/{i}.yaml', encoding='utf-8', errors='replace').read())
    pool = L[L.label_checkov.notna() & ~L.file_id.isin(d.file_id) & ~L.repo.isin(set(d.repo)) & ~L.near_dup_signature.isin(set(d.near_dup_signature.dropna()))]
    v = vec().fit(pool.text); Xp = v.transform(pool.text); rng = np.random.RandomState(4); rows = []
    for col, nm in (('final_working_label', 'Adjudicated'),):
        k, y = mk_y(d, col); Xk = v.transform(k.text)
        for tname, tcol in (('Text model trained on custom-rule labels', 'label_custom'), ('Text model trained on Checkov labels', 'label_checkov')):
            sc = lr().fit(Xp, pool[tcol].astype(int).values).decision_function(Xk); p = (sc > 0).astype(int); u = m_all(y, p)
            bs = [m_all(y[ix], p[ix])['bal'] for ix in (rng.randint(0, len(y), len(y)) for _ in range(2000))]
            ab = [roc_auc_score(y[ix], sc[ix]) * 100 for ix in (rng.randint(0, len(y), len(y)) for _ in range(2000)) if y[ix].sum() > 0]
            rows.append(dict(reference=nm, method=tname, train_n=len(pool), n=len(y), pos=int(y.sum()), **u, bal_lo=np.percentile(bs, 2.5), bal_hi=np.percentile(bs, 97.5), auc=roc_auc_score(y, sc) * 100, auc_lo=np.percentile(ab, 2.5), auc_hi=np.percentile(ab, 97.5)))
    R = pd.DataFrame(rows); R.to_csv('ml_transfer.csv', index=False); print(R.round(1).to_string(index=False))

if __name__ == '__main__':
    part = sys.argv[1]
    if part == 'reliability': reliability()
    elif part == 'scanners': scanners()
    elif part == 'ml_primary': ml('final_working_label', int(sys.argv[2]) if len(sys.argv) > 2 else 100, 'primary'); ml_contrasts()
    elif part == 'ml_sens':
        d, _, _ = load(); d.assign(agreed_label=np.where(d.reviewers_agree, d.label_r1, 'uncertain')).to_pickle('tmp.pkl')
        for col, tag in (('label_r1', 'annotator1'), ('label_r2', 'annotator2_pass2'), ('label_r2_pass1', 'annotator2_pass1')): ml(col, int(sys.argv[2]) if len(sys.argv) > 2 else 50, tag)
    elif part == 'ml_transfer': transfer()
