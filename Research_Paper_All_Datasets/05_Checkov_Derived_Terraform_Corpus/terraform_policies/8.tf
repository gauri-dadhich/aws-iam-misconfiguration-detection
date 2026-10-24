# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 8.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_8"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::...:user/superadmin"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::backet",
        "arn:aws:s3:::backet/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
