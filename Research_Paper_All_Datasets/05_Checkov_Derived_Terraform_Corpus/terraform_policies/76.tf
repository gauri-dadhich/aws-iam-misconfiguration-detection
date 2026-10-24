# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 76.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_76"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Connect",
        "iot:ListRetainedMessages"
      ],
      "Resource": "arn:aws:iot:ap-northeast-1:ACCOUNT:client/${iot:ClientId}",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
