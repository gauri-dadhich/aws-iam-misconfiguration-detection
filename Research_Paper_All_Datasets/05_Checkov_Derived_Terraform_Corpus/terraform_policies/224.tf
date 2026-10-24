# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 224.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_224"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontServicePrincipal",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::xxxx-bucket-name-xxxx/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudfront::xxxxxx:distribution/something"
        }
      }
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam:: xxxxxx:root"
        ]
      },
      "Action": [
        "s3:DeleteObject*",
        "s3:GetBucket*",
        "s3:List*",
        "s3:PutBucketPolicy"
      ],
      "Resource": [
        "arn:aws:s3::: xxxx-bucket-name-xxxx",
        "arn:aws:s3::: xxxx-bucket-name-xxxx/*"
      ],
      "Sid": "statement2"
    }
  ]
}
POLICY
}
