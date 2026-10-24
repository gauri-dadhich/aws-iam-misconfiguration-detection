# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 232.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_232"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::B-ID:root"
      },
      "Action": [
        "sms-voice:SendTextMessage",
        "sms-voice:SendVoiceMessage",
        "sms-voice:SendMediaMessage",
        "sms-voice:DescribeSenderIds"
      ],
      "Resource": "arn:aws:sms-voice:Region:A-ID:sender-id/SenderID/ISO",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
