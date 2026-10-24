# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 255.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_255"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "...",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::[account-id]:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
}
