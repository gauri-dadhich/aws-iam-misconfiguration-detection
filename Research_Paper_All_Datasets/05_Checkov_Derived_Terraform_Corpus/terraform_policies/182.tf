# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 182.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_182"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:ListNamedShadowsForThing",
      "Resource": "arn:aws:iot:ap-southeast-2:<accountId>:*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
