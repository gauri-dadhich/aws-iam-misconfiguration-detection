# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 96.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_96"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sns:Publish",
      "Resource": "arn:aws:sns:eu-west-1:account-b-id:sns-topic-name",
      "Condition": {
        "StringEquals": {
          "AWS:SourceAccount": [
            "account-b-id",
            "account-a-id"
          ]
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
