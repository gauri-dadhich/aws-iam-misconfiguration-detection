# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 120.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_120"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Resource": "*",
      "Effect": "Allow",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
