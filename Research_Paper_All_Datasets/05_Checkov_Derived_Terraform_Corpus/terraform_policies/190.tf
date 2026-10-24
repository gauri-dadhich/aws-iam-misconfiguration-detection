# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 190.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_190"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1637840001466",
  "Statement": [
    {
      "Sid": "Stmt1637839995898",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::angular-upload-files-2023-2024/*"
    }
  ]
}
POLICY
}
