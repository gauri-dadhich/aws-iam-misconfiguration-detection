# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 180.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_180"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ssm: TerminateSession",
        "ssm: StartSession",
        "ssm: ResumeSession"
      ],
      "Resource": [
        "arn:aws:ssm:*:*:session/S(aws:userid)-",
        "arn:aws:ssm:*:*:session/$(aws:username)-*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
