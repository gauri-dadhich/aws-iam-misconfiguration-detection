# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 147.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_147"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Connect"
      ],
      "Resource": [
        "*"
      ],
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:sa-east-1:195542078145:topic/$aws/certificates/create/*",
        "arn:aws:iot:sa-east-1:195542078145:topic/$aws/provisioning-templates/esp32_fleet_prov_template/provision/*"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:sa-east-1:195542078145:topicfilter/$aws/certificates/create/*",
        "arn:aws:iot:sa-east-1:195542078145:topicfilter/$aws/provisioning-templates/esp32_fleet_prov_template/provision/*"
      ],
      "Sid": "statement3"
    }
  ]
}
POLICY
}
