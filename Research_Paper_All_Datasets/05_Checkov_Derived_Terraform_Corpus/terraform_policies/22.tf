# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 22.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_22"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "ReadFromS3",
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::LOG_BUCKET_IN_ACCOUNT_B/*"
    }
  ]
}
POLICY
}
