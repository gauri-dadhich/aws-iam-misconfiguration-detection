# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 253.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_253"
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
      "Resource": "arn:aws:iot:us-east-1:123456789012:client/client1",
      "Condition": {
        "StringEquals": {
          "iot:LastWillTopic": "arn:aws:iot:region:account-id:topic/my/lastwill/topicName"
        }
      },
      "Sid": "statement1"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iot:Connect"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "iot:ConnectAttributes": [
            "PersistentConnect"
          ]
        }
      },
      "Sid": "statement2"
    }
  ]
}
POLICY
}
