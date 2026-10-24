# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 160.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_160"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "DescribeCryptoTrail",
      "Action": "logs:GetLogEvents",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:eu-west-1:ACCOUNT-ID:log-group:aws-controltower/CloudTrailLogs:log-stream:ORG-ID_CRYPTO-ACCOUNT-ID_CloudTrail_eu-west-*"
      ]
    }
  ]
}
POLICY
}
