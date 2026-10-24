# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 192.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_192"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": "arn:aws:iot:us-east-2:<account-id>:client/${cognito-identity.amazonaws.com:sub}",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:us-east-2:<account-id>:topic/your-app/${cognito-identity.amazonaws.com:sub}/status",
        "arn:aws:iot:us-east-2:<account-id>:topic/your-app/${cognito-identity.amazonaws.com:sub}/notifications"
      ],
      "Sid": "statement2"
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:us-east-2:<account-id>:topicfilter/your-app/${cognito-identity.amazonaws.com:sub}/notifications"
      ],
      "Sid": "statement3"
    }
  ]
}
POLICY
}
