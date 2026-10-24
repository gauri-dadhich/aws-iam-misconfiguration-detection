RESEARCH PAPER — DATASETS PACKAGE
Machine Learning-Based Detection of IAM and API Misconfigurations in Cloud Environments

This package contains the datasets/data corpora actually used or directly evaluated in the research workflow.

1. 01_Synthetic_IAM_Dataset
   - 1,000 synthetic AWS IAM policy profiles (700 compliant / 300 misconfigured)
   - CSV model-ready feature matrix, raw JSON, summary, generator, and dataset documentation.
   - Source: Mendeley Data dataset used by the study.

2. 02_Synthetic_API_Dataset
   - 1,000 synthetic API Gateway/Lambda configuration profiles (700 compliant / 300 misconfigured).
   - Generated for this study.

3. 03_CloudFix_RealWorld_IAM
   - 282 original AWS IAM policies collected from AWS forums.
   - These were used for external IAM screening/prediction-distribution analysis and the Checkov comparison.
   - The full CloudFix source archive is also included for provenance.
   - IMPORTANT: CloudFix does not provide a verified binary secure/misconfigured label for every original policy; do not treat these as ground-truth labels.

4. 04_Misdet_RealWorld_IAM
   - Misdet source artifact and the IAM policy workbook used for the limited external labeled evaluation.
   - The workbook contains 515 rows; one policy could not be parsed by the feature extractor, leaving 514 usable records.
   - Only a sparse subset has documented misconfiguration names; absence of a name is NOT a confirmed compliant label.

5. 05_Checkov_Derived_Terraform_Corpus
   - 282 deterministic Terraform wrappers created from the CloudFix original policies for the Checkov experiment.
   - This is a DERIVED evaluation corpus, not a separate independent dataset.
   - The original policy documents were retained unchanged inside the wrappers.

NOT included as primary datasets:
- PHOENIX and SlsDetector were examined as possible API/serverless external sources, but were not used to report API-security precision/recall/F1 because their labels did not match the study's API security-label definition.
- API feature-corruption files and threshold/SHAP/results files are experiment outputs, not source datasets.
