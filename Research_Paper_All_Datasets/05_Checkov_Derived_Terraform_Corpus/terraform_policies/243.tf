# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 243.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_243"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "rds-db:connect",
      "Effect": "Allow",
      "Resource": "arn:aws:rds-db:*:<accountid>:dbuser:cluster-avcd/<user>",
      "Sid": "statement1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
