"""Study 3 ML diagnostic: repeated group splits, trivial baselines and a size/metadata-only baseline.

Inputs (same folder): labels.csv, metadata.csv, raw/raw/<file_id>.yaml
Outputs: ml_split_results.csv (one row per split x setting x model), ml_summary.csv
"""
import sys, numpy as np, pandas as pd, sklearn
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.model_selection import GroupShuffleSplit
from sklearn.metrics import accuracy_score, balanced_accuracy_score, f1_score, roc_auc_score

N_REPEATS = int(sys.argv[1]) if len(sys.argv) > 1 else 100
print('scikit-learn', sklearn.__version__, 'pandas', pd.__version__, 'numpy', np.__version__)

lab = pd.read_csv('labels.csv'); meta = pd.read_csv('metadata.csv')
df = lab.merge(meta[['file_id', 'size_bytes']], on='file_id', how='left')
texts = {i: open(f'raw/raw/{i}.yaml', encoding='utf-8', errors='replace').read() for i in df.file_id}
df['text'] = df.file_id.map(texts)
df['n_lines'] = df.text.str.count('\n') + 1
df['n_chars'] = df.text.str.len()

def tfidf_lr():
    return make_pipeline(TfidfVectorizer(ngram_range=(1, 2), max_features=8000, min_df=2, sublinear_tf=True),
                         LogisticRegression(class_weight='balanced', solver='liblinear', max_iter=500))
def meta_lr():
    return make_pipeline(StandardScaler(), LogisticRegression(class_weight='balanced', max_iter=500))
def meta_tree():
    return DecisionTreeClassifier(max_depth=3, min_samples_leaf=10, class_weight='balanced', random_state=0)

def meta_X(d):
    return np.column_stack([np.log1p(d.size_bytes), np.log1p(d.n_lines), np.log1p(d.n_resources)])

def metrics(y, pred, score=None):
    out = dict(acc=accuracy_score(y, pred), bal_acc=balanced_accuracy_score(y, pred),
               f1=f1_score(y, pred, zero_division=0))
    out['auc'] = roc_auc_score(y, score) if score is not None and len(set(y)) == 2 else np.nan
    return out

settings = [('Custom', 'label_custom', 'repo'), ('Custom', 'label_custom', 'near_dup_signature'),
            ('Checkov', 'label_checkov', 'repo'), ('Checkov', 'label_checkov', 'near_dup_signature')]
rows = []
def run_split(d, ycol, gcol, seed, target, split_name, tag):
    y = d[ycol].astype(int).values; g = d[gcol].values
    tr, te = next(GroupShuffleSplit(n_splits=1, test_size=0.2, random_state=seed).split(d, y, g))
    ytr, yte = y[tr], y[te]
    base = dict(target=target, split=split_name, seed=seed, tag=tag, n_test=len(te), flagged_share=yte.mean())
    maj = int(round(ytr.mean()) >= 1) if False else int(ytr.mean() >= 0.5)
    rows.append({**base, 'model': 'majority', **metrics(yte, np.full(len(te), maj), None)})
    rows.append({**base, 'model': 'always_flag', **metrics(yte, np.ones(len(te), int), None)})
    vec = TfidfVectorizer(ngram_range=(1, 2), max_features=8000, min_df=2, sublinear_tf=True).fit(d.text.values[tr])
    Xtr, Xte = vec.transform(d.text.values[tr]), vec.transform(d.text.values[te])
    lr = lambda: LogisticRegression(class_weight='balanced', solver='liblinear', max_iter=500)
    m = lr().fit(Xtr, ytr)
    rows.append({**base, 'model': 'tfidf_lr', **metrics(yte, m.predict(Xte), m.decision_function(Xte))})
    Xm = meta_X(d)
    m = meta_lr().fit(Xm[tr], ytr)
    rows.append({**base, 'model': 'meta_lr', **metrics(yte, m.predict(Xm[te]), m.decision_function(Xm[te]))})
    m = meta_tree().fit(Xm[tr], ytr)
    rows.append({**base, 'model': 'meta_tree', **metrics(yte, m.predict(Xm[te]), m.predict_proba(Xm[te])[:, 1])})
    # sanity control: same pipeline, training labels shuffled (should sit near chance)
    rng = np.random.RandomState(seed); ysh = rng.permutation(ytr)
    m = lr().fit(Xtr, ysh)
    rows.append({**base, 'model': 'tfidf_lr_shuffled_labels', **metrics(yte, m.predict(Xte), m.decision_function(Xte))})

SEL = int(sys.argv[2]) if len(sys.argv) > 2 else None
SUF = f'_s{SEL}' if SEL is not None else ''
for k, (target, ycol, gcol) in enumerate(settings):
    if SEL is not None and k != SEL: continue
    d = df.dropna(subset=[ycol]).reset_index(drop=True)
    sname = 'repo' if gcol == 'repo' else 'near-dup'
    for seed in (42, 43, 44):                      # original three seeds (reproduces Table VIII)
        run_split(d, ycol, gcol, seed, target, sname, 'orig3')
    for seed in range(1000, 1000 + N_REPEATS):     # repeated splits
        run_split(d, ycol, gcol, seed, target, sname, 'repeat')
    print('done', target, sname, flush=True)

res = pd.DataFrame(rows); res.to_csv(f'ml_split_results{SUF}.csv', index=False)

def q(x, p): return np.nanpercentile(x, p)
summ = []
for (target, split, tag, model), g in res.groupby(['target', 'split', 'tag', 'model']):
    summ.append(dict(target=target, split=split, tag=tag, model=model, n_splits=len(g), n_test_mean=g.n_test.mean(),
                     acc=g.acc.mean(), bal_acc=g.bal_acc.mean(), bal_acc_sd=g.bal_acc.std(ddof=1),
                     bal_acc_p2_5=q(g.bal_acc, 2.5), bal_acc_p97_5=q(g.bal_acc, 97.5),
                     f1=g.f1.mean(), auc=g.auc.mean(), auc_p2_5=q(g.auc, 2.5), auc_p97_5=q(g.auc, 97.5)))
pd.DataFrame(summ).to_csv(f'ml_summary{SUF}.csv', index=False)

# paired differences on the repeated splits
rep = res[res.tag == 'repeat']
pair = []
for (target, split), g in rep.groupby(['target', 'split']):
    w = g.pivot(index='seed', columns='model', values=['acc', 'bal_acc', 'f1', 'auc'])
    for base in ('always_flag', 'meta_lr', 'meta_tree'):
        for met in ('acc', 'bal_acc', 'f1', 'auc'):
            if met == 'auc' and base == 'always_flag': continue
            dlt = (w[met]['tfidf_lr'] - w[met][base]).dropna()
            pair.append(dict(target=target, split=split, vs=base, metric=met, mean_diff=dlt.mean(),
                             p2_5=q(dlt, 2.5), p97_5=q(dlt, 97.5), share_tfidf_better=(dlt > 0).mean()))
pd.DataFrame(pair).to_csv(f'ml_paired_differences{SUF}.csv', index=False)
print('finished')
