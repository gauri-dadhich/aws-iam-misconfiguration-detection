# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 77.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_77"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "mediapackage:*"
      ],
      "Resource": "*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
