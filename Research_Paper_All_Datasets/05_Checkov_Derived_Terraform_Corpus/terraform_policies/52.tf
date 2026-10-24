# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 52.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_52"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "lex:GetSession",
        "lex:RecognizeText",
        "lex:PutSession",
        "lex:DeleteSession",
        "lex:StartConversation",
        "lex:RecognizeUtterance"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
