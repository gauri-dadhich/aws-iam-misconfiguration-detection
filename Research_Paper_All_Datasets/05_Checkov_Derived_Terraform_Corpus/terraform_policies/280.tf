# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 280.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_280"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "Get:*",
      "Principal": "*",
      "Resource": "*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
