# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 5.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_5"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "BackupPolicy01",
  "Statement": [
    {
      "Sid": "BackupPolicy01",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::83743546469343:user/user-backup"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::my-backup/*",
        "arn:aws:s3:::my-backup"
      ],
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "123.87.210.171/32"
        }
      }
    }
  ]
}
POLICY
}
