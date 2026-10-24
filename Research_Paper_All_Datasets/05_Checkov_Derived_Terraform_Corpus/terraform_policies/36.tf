# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 36.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_36"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "aoss:APIAccessAll",
      "Resource": "arn:aws:aoss:us-east-2:{accountNumber}:collection/{collectionId}",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": "aoss:DashboardsAccessAll",
      "Resource": "arn:aws:aoss:us-east-2:{accountNumber}:collection/{collectionId}",
      "Sid": "statement2"
    }
  ]
}
POLICY
}
