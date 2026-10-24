# Delete this file before the repository goes public

Add these from your own computer (they were not available to me, and the paper says they exist):
1. `scripts/collect_templates.py`: the GitHub collector (Section VI-A of the paper).
2. The 14 custom rules and the script that turns templates into `labels.csv` (custom side). Fix the redundant always-true condition in the CORS rule, re-run, confirm the corpus count is still 79 and note the fix in a CHANGELOG.
3. The Checkov command and, if small, per-file scan results (`checkov --framework cloudformation ...`, version 3.3.26).
4. `studies12/`: notebooks, feature extracts and result files for Studies 1 and 2, **and the 1,000-profile synthetic API dataset** (the paper says it is released). Then add one line for it to the Layout section of README.md. Put the supplement (Studies 1 and 2 in full) there too.
5. Check nothing sensitive is in the released files: `grep -rEn "AKIA[0-9A-Z]{16}|BEGIN (RSA |EC )?PRIVATE KEY" .` must print nothing.
6. Create the GitHub repository (public; the URL in the paper is https://github.com/gauri-dadhich/aws-iam-misconfiguration-detection), push, tag `v1.0`, connect it to Zenodo to get a DOI and add the DOI to the paper.
7. If the venue is double-blind: remove names from the paper and use an anonymous mirror of this repository for review.
