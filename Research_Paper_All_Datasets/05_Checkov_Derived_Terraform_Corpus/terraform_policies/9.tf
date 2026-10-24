# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 9.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_9"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "aoss:BatchGetCollection",
        "aoss:DeleteCollection",
        "aoss:UpdateAccessPolicy",
        "aoss:CreateAccessPolicy",
        "aoss:CreateSecurityPolicy",
        "aoss:ListCollections",
        "aoss:ListAccessPolicies",
        "aoss:CreateCollection",
        "aoss:DashboardsAccessAll",
        "aoss:APIAccessAll",
        "aoss:*"
      ],
      "Resource": "*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            "76.76.21.0/24",
            "85.224.0.0/13"
          ]
        }
      }
    }
  ]
}
POLICY
}
