# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 204.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_204"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": [
        "arn:aws:s3:::aws-windows-downloads-us-east-1/*",
        "arn:aws:s3:::amazon-ssm-us-east-1/*",
        "arn:aws:s3:::amazon-ssm-packages-us-east-1/*",
        "arn:aws:s3:::us-east-1-birdwatcher-prod/*",
        "arn:aws:s3:::aws-ssm-document-attachments-us-east-1/*",
        "arn:aws:s3:::patch-baseline-snapshot-us-east-1/*",
        "arn:aws:s3:::aws-ssm-us-east-1/*",
        "arn:aws:s3:::aws-patchmanager-macos-us-east-1/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
