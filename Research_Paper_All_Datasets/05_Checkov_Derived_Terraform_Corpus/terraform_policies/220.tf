# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 220.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_220"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateRole",
        "iam:PutRolePolicy",
        "lambda:CreateFunction",
        "lambda:InvokeAsync",
        "lambda:InvokeFunction",
        "iam:PassRole"
      ],
      "Resource": [
        "*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
