# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 144.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_144"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "s3:AcceptDataGrant"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:PrincipalOrgID": "ORGID"
        },
        "StringNotEquals": {
          "aws:PrincipalAccount": "ACCOUNTID"
        }
      },
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:AcceptDataGrant"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:PrincipalAccount": "ACCOUNTID"
        }
      },
      "Sid": "statement2"
    }
  ]
}
POLICY
}
