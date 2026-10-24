# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 143.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_143"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ses:SendTemplatedEmail",
        "ses:SendEmail"
      ],
      "Resource": [
        "arn:aws:ses:${region}:${account_Y}:identity/${email_identity}",
        "arn:aws:ses:${region}:${account_Y}:template/TEMPLATE"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
