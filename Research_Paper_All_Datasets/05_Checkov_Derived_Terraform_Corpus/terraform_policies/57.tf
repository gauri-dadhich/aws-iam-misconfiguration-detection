# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 57.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_57"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "execute-api:Invoke",
      "Resource": [
        "arn:aws:execute-api:ap-northeast-2:0xxxxxxxxxx2:rxxxxxx2/*/GET/user/*"
      ],
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "execute-api:Invoke",
      "Resource": [
        "arn:aws:execute-api:ap-northeast-2:0xxxxxxxxxx2:rxxxxxx2/*/GET/user/*/api/*"
      ],
      "Sid": "statement2"
    }
  ]
}
POLICY
}
