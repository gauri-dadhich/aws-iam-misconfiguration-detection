# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 20.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_20"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "aoss:CreateAccessPolicy",
        "aoss:CreateSecurityPolicy",
        "aoss:CreateCollection",
        "aoss:ListCollections",
        "aoss:BatchGetCollection",
        "aoss:UpdateCollection",
        "aoss:DeleteCollection",
        "aoss:ListAccessPolicies",
        "aoss:ListSecurityPolicies",
        "aoss:ListTagsForResource",
        "aoss:UpdateAccessPolicy",
        "aoss:GetSecurityPolicy",
        "aoss:UpdateSecurityPolicy",
        "iam:ListUsers",
        "iam:ListRoles"
      ],
      "Resource": "*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
