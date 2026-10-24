"""Study 3 agreement statistics between the tools. Run in the folder with labels.csv and kics_labels.csv."""
import re, numpy as np, pandas as pd
from scipy.stats import binomtest
from sklearn.metrics import cohen_kappa_score
ALLOW = {'CKV_AWS_107','CKV_AWS_108','CKV_AWS_109','CKV_AWS_110','CKV_AWS_111','CKV_AWS_40','CKV_AWS_60','CKV_AWS_258'}
L = pd.read_csv('labels.csv').merge(pd.read_csv('kics_labels.csv')[['file_id', 'kics_all', 'kics_high']], on='file_id')
c = L[L.label_checkov.notna()].reset_index(drop=True)
ids = lambda s: set(re.split(r'[;,\s]+', str(s))) - {'', 'nan'}
tools = {'custom (14 rules)': c.label_custom.values, 'Checkov (all checks)': c.label_checkov.astype(int).values, 'KICS (HIGH/CRITICAL)': c.kics_high.values,
         'Checkov (security subset)': c.checkov_ids.apply(lambda s: int(len(ids(s) & ALLOW) > 0)).values,
         'custom (IAM/API-exposure subset)': c.custom_codes.apply(lambda s: int(any(x.startswith(('IAM', 'CROSS')) or x in ('API_FUNCTION_URL_NO_AUTH', 'API_LAMBDA_PERMISSION_OPEN') for x in str(s).split(';'))) if pd.notna(s) else 0).values}
def stats(a, b):
    po = (a == b).mean(); p = (a.mean() + b.mean()) / 2
    return dict(kappa=cohen_kappa_score(a, b), ac1=(po - 2 * p * (1 - p)) / (1 - 2 * p * (1 - p)), pabak=2 * po - 1, observed=po, jaccard=((a == 1) & (b == 1)).sum() / ((a == 1) | (b == 1)).sum())
groups = c.repo.values; ug = np.unique(groups); idx = {g: np.where(groups == g)[0] for g in ug}; rng = np.random.RandomState(0)
def cluster_ci(a, b, key):
    out = []
    for _ in range(2000):
        ix = np.concatenate([idx[g] for g in ug[rng.randint(0, len(ug), len(ug))]]); out.append(stats(a[ix], b[ix])[key])
    return np.nanpercentile(out, [2.5, 97.5])
rows = []
for x, y in (('custom (14 rules)', 'Checkov (all checks)'), ('custom (14 rules)', 'KICS (HIGH/CRITICAL)'), ('Checkov (all checks)', 'KICS (HIGH/CRITICAL)'),
             ('custom (IAM/API-exposure subset)', 'Checkov (security subset)')):
    s = stats(tools[x], tools[y]); lo, hi = cluster_ci(tools[x], tools[y], 'kappa'); lo2, hi2 = cluster_ci(tools[x], tools[y], 'ac1')
    rows.append(dict(a=x, b=y, n=len(c), flagged_a=int(tools[x].sum()), flagged_b=int(tools[y].sum()), **s, kappa_lo=lo, kappa_hi=hi, ac1_lo=lo2, ac1_hi=hi2))
R = pd.DataFrame(rows); R.to_csv('study3_agreement_stats.csv', index=False); pd.set_option('display.width', 250); print(R.round(3).to_string(index=False))
a, b = tools['custom (14 rules)'], tools['Checkov (all checks)']
print('exact McNemar p (custom-only vs Checkov-only):', round(binomtest(int(((a == 1) & (b == 0)).sum()), int((a != b).sum()), .5).pvalue, 4))
print('repositories:', len(ug), ' templates per repository (max):', max(len(v) for v in idx.values()))
