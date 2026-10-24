# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 145.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_145"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "lex:UpdateBot",
        "lex:GetBot",
        "lex:CreateSlot",
        "lex:CreateSlotType"
      ],
      "Resource": "arn:aws:lex:us-east-1:1234567890:bot/ABCDEFG",
      "Principal": {
        "AWS": "arn:aws:iam:1234567890:user/lastname.firstname"
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
