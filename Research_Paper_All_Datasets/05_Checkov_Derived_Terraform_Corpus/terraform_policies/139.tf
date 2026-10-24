# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 139.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_139"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": "arn:aws:iot:us-east-2:471112966900:client/${iot:Connection.Thing.ThingName}",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:us-east-2:471112966900:topic/${iot:Connection.Thing.ThingName}/*",
        "arn:aws:iot:us-east-2:471112966900:topic/$aws/things/${iot:Connection.Thing.ThingName}/*"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:us-east-2:471112966900:topicfilter/${iot:Connection.Thing.ThingName}/*",
        "arn:aws:iot:us-east-2:471112966900:topicfilter/$aws/things/${iot:Connection.Thing.ThingName}/*"
      ],
      "Sid": "statement3"
    },
    {
      "Effect": "Allow",
      "Action": "greengrass:*",
      "Resource": "*",
      "Sid": "statement4"
    }
  ]
}
POLICY
}
