# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 118.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_118"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::[account A]:role/service-role/codebuild-service-role-foo-bar"
      },
      "Resource": [
        "arn:aws:s3:::mytestbucket",
        "arn:aws:s3:::mytestbucket/*"
      ],
      "Action": [
        "s3:*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
