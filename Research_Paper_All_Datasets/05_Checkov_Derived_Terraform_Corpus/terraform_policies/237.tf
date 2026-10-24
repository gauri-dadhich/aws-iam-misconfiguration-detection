# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 237.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_237"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:eu-west-2:000000000000:topicfilter/*/${iot:Connection.Thing.ThingName}/*",
        "arn:aws:iot:eu-west-2:000000000000:topicfilter/$aws/things/${iot:Connection.Thing.ThingName}/jobs/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
