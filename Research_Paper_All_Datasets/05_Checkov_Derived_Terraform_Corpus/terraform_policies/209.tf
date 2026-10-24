# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 209.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_209"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:GetBucketPolicy",
        "s3:PutBucketPolicy",
        "s3:GetAccelerateConfiguration",
        "s3:PutAccelerateConfiguration"
      ],
      "Resource": [
        "arn:aws:s3:::<our_bucket_name>/*",
        "arn:aws:s3:::<our_bucket_name>"
      ]
    }
  ]
}
POLICY
}
