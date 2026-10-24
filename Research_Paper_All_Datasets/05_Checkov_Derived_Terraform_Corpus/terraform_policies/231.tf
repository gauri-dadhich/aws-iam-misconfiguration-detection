# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 231.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_231"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kms:CreateKey",
        "kms:TagResource"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestTag/Name": "demo"
        }
      },
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:ScheduleKeyDeletion",
        "kms:PutKeyPolicy"
      ],
      "Resource": "arn:aws:kms:*:486555357186:key/*",
      "Condition": {
        "StringEquals": {
          "aws:ResourceTag/Name": "demo"
        }
      },
      "Sid": "statement2"
    }
  ]
}
POLICY
}
