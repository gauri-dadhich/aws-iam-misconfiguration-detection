"""Study 3 agreement statistics (custom rules vs Checkov). Run in the folder with labels.csv."""
import re, numpy as np, pandas as pd
from scipy.stats import binomtest
from sklearn.metrics import cohen_kappa_score
ALLOW = {'CKV_AWS_107','CKV_AWS_108','CKV_AWS_109','CKV_AWS_110','CKV_AWS_111','CKV_AWS_40','CKV_AWS_60','CKV_AWS_258'}
L = pd.read_csv('labels.csv'); c = L[L.label_checkov.notna()].copy()
y1 = c.label_custom.values; y2 = c.label_checkov.astype(int).values
po = (y1 == y2).mean(); pe = y1.mean()*y2.mean() + (1-y1.mean())*(1-y2.mean())
jac = lambda a, b: ((a==1)&(b==1)).sum() / ((a==1)|(b==1)).sum()
print(f'n={len(c)} observed {po:.3f} chance {pe:.3f} kappa {cohen_kappa_score(y1,y2):.3f} jaccard {jac(y1,y2):.2f}')
print('exact McNemar p (141 vs 92):', round(binomtest(int(((y1==1)&(y2==0)).sum()), int((y1!=y2).sum()), .5).pvalue, 4))
rng = np.random.RandomState(0); ks = [cohen_kappa_score(y1[i], y2[i]) for i in (rng.randint(0, len(y1), len(y1)) for _ in range(2000))]
print('bootstrap 95% interval for kappa:', np.percentile(ks, [2.5, 97.5]).round(3))
ids = lambda s: set(re.split(r'[;,\s]+', str(s))) - {'', 'nan'}
sec = c.checkov_ids.apply(lambda s: int(len(ids(s) & ALLOW) > 0)).values
restr = c.custom_codes.apply(lambda s: int(any(x.startswith(('IAM','CROSS')) or x in ('API_FUNCTION_URL_NO_AUTH','API_LAMBDA_PERMISSION_OPEN') for x in str(s).split(';'))) if pd.notna(s) else 0).values
print('security-only Checkov positives:', sec.sum(), '| restricted custom positives:', restr.sum())
print(f'all custom vs security-only: kappa {cohen_kappa_score(y1,sec):.3f} jaccard {jac(y1,sec):.2f}')
print(f'restricted custom vs security-only: kappa {cohen_kappa_score(restr,sec):.3f} jaccard {jac(restr,sec):.2f}')
