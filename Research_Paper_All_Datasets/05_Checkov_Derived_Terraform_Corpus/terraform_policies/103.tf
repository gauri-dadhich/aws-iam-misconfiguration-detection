# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 103.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_103"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "sample",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "IAM user login to console"
        ]
      },
      "Action": "s3:*",
      "Resource": [
        "s3 arn",
        "s3 arn/*"
      ]
    }
  ]
}
POLICY
}
