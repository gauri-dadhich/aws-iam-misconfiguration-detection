# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 69.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_69"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": "*",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:us-east-1:<My-ID>:topic/$aws/certificates/create/*",
        "arn:aws:iot:us-east-1:<My-ID>:topic/$aws/provisioning-templates/DrainAlert_FleetTemplate/provision/*"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:us-east-1:<My-ID>:topicfilter/$aws/certificates/create/*",
        "arn:aws:iot:us-east-1:<My-ID>:topicfilter/$aws/provisioning-templates/DrainAlert_FleetTemplate/provision/*"
      ],
      "Sid": "statement3"
    }
  ]
}
POLICY
}
