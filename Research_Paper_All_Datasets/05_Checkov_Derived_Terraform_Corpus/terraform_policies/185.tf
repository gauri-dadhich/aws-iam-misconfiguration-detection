# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 185.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_185"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::account-id:role/your-irsa-role",
          "arn:aws:iam::account-id:user/your-user"
        ]
      },
      "Action": "execute-api:Invoke",
      "Resource": "arn:aws:execute-api:region:account-id:appsync-api-id/*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
