# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 16.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_16"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "my-app-efs-pol",
  "Statement": [
    {
      "Sid": "my-app-efs-pol-sid",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "elasticfilesystem:ClientMount",
        "elasticfilesystem:ClientWrite",
        "elasticfilesystem:ClientRootAccess",
        "elasticfilesystem:DescribeMountTargets"
      ],
      "Resource": "arn:aws:elasticfilesystem:us-east-1:<myaccount_id>:file-system/fs-<filesystemid>",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "true",
          "elasticfilesystem:AccessedViaMountTarget": "true"
        }
      }
    }
  ]
}
POLICY
}
