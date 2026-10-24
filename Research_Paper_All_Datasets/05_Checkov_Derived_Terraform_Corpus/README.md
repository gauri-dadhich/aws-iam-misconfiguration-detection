# Checkov + CloudFix comparison bundle (v2)

This bundle converts the 282 real-world CloudFix AWS IAM policy JSON files into Terraform `aws_iam_policy` resources for scanning with Checkov built-in Terraform checks.

Important: this is a static-analysis wrapper. It does not apply Terraform, create AWS resources, or require AWS credentials. The original IAM policy JSON is embedded unchanged in each wrapper.

Why v2: the first bundle used `data "aws_iam_policy_document"` wrappers. Checkov 3.3.22 on the user's Windows setup returned a Terraform parsing error for those files. v2 uses a standard `resource "aws_iam_policy"` with a literal JSON policy heredoc, which Checkov supports for IAM resource checks.

Do not modify the `.tf` files before scanning. Use Checkov's built-in checks only.
