# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 221.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_221"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": [
        "ses:SendEmail",
        "ses:SendBulkEmail"
      ],
      "Resource": [
        "arn:aws:ses:eu-west-3:111222333444:identity/MyUser",
        "arn:aws:ses:eu-west-3:111222333444:template/*",
        "arn:aws:ses:eu-west-3:111222333444configuration-set/*"
      ]
    }
  ]
}
POLICY
}
