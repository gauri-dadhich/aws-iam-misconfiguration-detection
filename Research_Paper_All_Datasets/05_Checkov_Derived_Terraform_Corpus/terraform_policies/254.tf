# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 254.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_254"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "secretsmanager:ListSecrets",
      "Resource": [
        "arn:aws:secretsmanager:region:account-id:secret:secret-name-1"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
