# Evaluating ML misconfiguration detection on AWS IAM and API configurations: companion materials

Code, labels and analysis outputs for the paper *Why Evaluating Machine-Learning Misconfiguration Detection on AWS IAM and API Configurations Is Hard: Four Studies and What They Show* (Gauri Dadhich).

This repository supports Studies 3 and 4 of the paper (669 public AWS SAM/CloudFormation templates; 200 of them labelled by two annotators). The template files themselves are **not** included because the repositories they come from carry mixed licenses (277 have none). Each file is identified by repository, path, commit and hash, and a script re-fetches and verifies them.

## Layout

    data/        labels, metadata and the Study 4 annotation files
    scripts/     fetch_templates.py, study3_run_ml.py, study3_agreement_stats.py, study4_validation_study.py
    results/     outputs behind Tables IX–XII (study3/, study4/)
    requirements.txt

Data files (`data/`):

| File | Content |
|---|---|
| `metadata.csv` | per template: repository, path, commit, license, size, SHA-256 (of the content with whitespace removed), near-duplicate signature |
| `labels.csv` | per template: custom-rule label and rule codes, Checkov label and failed check IDs, agreement category |
| `annotation_instructions.txt` | instructions given to the two annotators (Study 4) |
| `reviewer1_sheet.csv` | annotator 1: label, evidence, confidence for the 200 sampled templates |
| `reviewer2_blinded_sheet.csv` | annotator 2, first (blinded) pass |
| `consolidated_200_provisional_labels.csv` | both annotators' labels as used for adjudication (annotator 2, second pass), the adjudicated label and the reason for each of the 74 disagreements |

## Reproducing the numbers

    pip install -r requirements.txt
    cd data
    python ../scripts/fetch_templates.py --workers 16      # writes data/raw/raw/<file_id>.yaml and checks every hash
    python ../scripts/study3_agreement_stats.py            # kappa, McNemar, security-only recount (Section VI)
    python ../scripts/study3_run_ml.py 60 0                # ML on scanner labels, setting 0..3 (Table IX)
    python ../scripts/study4_validation_study.py reliability
    python ../scripts/study4_validation_study.py scanners
    python ../scripts/study4_validation_study.py ml_primary 100
    python ../scripts/study4_validation_study.py ml_transfer
    python ../scripts/study4_validation_study.py ml_sens 40

The ML parts take several minutes each on one CPU. All random seeds are fixed. Environment used: scikit-learn 1.8.0, pandas 3.0.2, numpy 2.4.4. The TF-IDF step uses `sublinear_tf=True`.

## Things to know

- **One template is gone.** When last checked (21 October 2026), 668 of the 669 files could be re-fetched at their recorded commits and matched their hashes. File `16bd17e26d2e` (repository `Isa18121999/Climate-alert--platform`, no license) now returns 404. It belongs to the Study 4 sample, so `study4_validation_study.py` needs it; it is available from the author on request for verification.
- **The labels are not ground truth.** `labels.csv` holds tool outputs (custom rules, Checkov). The Study 4 labels come from two non-expert annotators, one of whom used an AI assistant to check labels and reasons, and 35 of the 40 positive labels were set in an adjudication by the author, who also wrote the custom rules. Please do not reuse any of these labels as vulnerability ground truth without checking them.
- **Annotator 2 has two versions of labels** (blinded sheet and the version used for adjudication); they differ on 54 of 200 labels. The paper reports both.
- **Versions.** The Python and library versions of the original Study 1 and Study 2 runs were not recorded. Checkov 3.3.22 was used for Study 2 and 3.3.26 for Study 3.

## AI assistance

An AI assistant (Claude, Anthropic) was used by annotator 2 to check labels and reasons, and by the author for help with analysis code, calculations and drafting. The author checked the results and is responsible for the content.

## License

Code: MIT (see `LICENSE`). Labels, annotations and result files: CC BY 4.0. Template contents are not redistributed and remain under their original licenses.
