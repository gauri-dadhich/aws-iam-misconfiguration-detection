# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 270.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_270"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::<ACCOUNT_ID>:root"
      },
      "Action": [
        "s3:PutAccelerateConfiguration",
        "s3:PutBucketPolicy",
        "s3:GetBucketPolicy",
        "s3:GetBucketPolicyStatus",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:ListBucketVersions",
        "s3:ListMultipartUploadParts",
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketAcl"
      ],
      "Resource": [
        "arn:aws:s3:::subline-be",
        "arn:aws:s3:::subline-be/*"
      ]
    }
  ]
}
POLICY
}
