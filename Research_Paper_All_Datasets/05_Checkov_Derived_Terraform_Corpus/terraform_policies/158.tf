# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 158.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_158"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:eu-west-1:<YOUR_ACCOUNT_ID>:ams-eu-sp-traffic-queue",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "119690846692"
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
