# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 65.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_65"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Action": [
        "ses:SendEmail",
        "ses:GetContact",
        "ses:GetContactList",
        "ses:CreateContactList",
        "ses:CreateContact",
        "ses:DeleteContact",
        "ses:DeleteContactList",
        "ses:ListContactLists",
        "ses:ListContacts"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
POLICY
}
