# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 72.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_72"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "DenyNoEncryption",
      "Effect": "Deny",
      "Action": "s3:PutObject",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256",
          "aws:ResourceTag/exempted": "yes"
        }
      }
    }
  ]
}
POLICY
}
