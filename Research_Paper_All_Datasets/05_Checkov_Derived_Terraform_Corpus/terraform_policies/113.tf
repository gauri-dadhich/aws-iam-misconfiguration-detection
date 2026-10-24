# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 113.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_113"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": [
        "arn:aws:iot:eu-west-1:123456789012:client/${iot:Connection.Thing.ThingName}"
      ],
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Publish",
      "Resource": [
        "arn:aws:iot:eu-west-1:123456789012:topic/${iot:Connection.Thing.ThingName}/temperature"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Receive",
      "Resource": "arn:aws:iot:eu-west-1:123456789012:topic/${iot:Connection.Thing.ThingName}/command",
      "Sid": "statement3"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": "arn:aws:iot:eu-west-1:123456789012:topicfilter/${iot:Connection.Thing.ThingName}/command",
      "Sid": "statement4"
    }
  ]
}
POLICY
}
