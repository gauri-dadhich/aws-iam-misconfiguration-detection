# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 23.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_23"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "asdf",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::{{accountA}}:root"
        ]
      },
      "Action": [
        "sms-voice:DescribePhoneNumbers",
        "sms-voice:SendTextMessage",
        "sms-voice:SendVoiceMessage"
      ],
      "Resource": "arn:aws:sms-voice:us-east-2:{{accountB}}:phone-number/phone-abcdefabcdef"
    }
  ]
}
POLICY
}
