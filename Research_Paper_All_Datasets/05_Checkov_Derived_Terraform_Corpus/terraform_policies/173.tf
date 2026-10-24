# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 173.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_173"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "rds-db:connect",
      "Effect": "Allow",
      "Resource": "arn:aws:rds-db:us-east-1:1234567890:dbuser:cluster-ABCVDEFGHIJKLMNOPQRSTUVWXYZ/${aws:username}",
      "Sid": "statement1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
