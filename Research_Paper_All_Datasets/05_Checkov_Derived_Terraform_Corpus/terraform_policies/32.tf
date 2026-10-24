# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 32.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_32"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": "arn:aws:iot:eu-west-3:ACCOUNT_ID:client/CLIENT_ID",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Publish",
      "Resource": [
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topic/CLIENT_ID/*",
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topic/$aws/things/CLIENT_ID/shadow/*"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topicfilter/CLIENT_ID/*",
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topicfilter/$aws/things/CLIENT_ID/shadow/*"
      ],
      "Sid": "statement3"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Receive",
      "Resource": [
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topic/CLIENT_ID/*",
        "arn:aws:iot:eu-west-3:ACCOUNT_ID:topic/$aws/things/CLIENT_ID/shadow/*"
      ],
      "Sid": "statement4"
    }
  ]
}
POLICY
}
