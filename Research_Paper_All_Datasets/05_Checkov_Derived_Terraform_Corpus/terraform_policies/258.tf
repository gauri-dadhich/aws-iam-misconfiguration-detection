# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 258.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_258"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Resource": [
        "arn:aws:es:us-east-1:1234567890:domain/ap-dev-search",
        "arn:aws:es:us-east-1:1234567890:domain/ap-dev-search/*"
      ],
      "Effect": "Allow",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
