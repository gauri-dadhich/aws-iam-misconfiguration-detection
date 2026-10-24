# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 269.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_269"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAppFlowDestinationActions",
      "Effect": "Allow",
      "Principal": {
        "Service": "appflow.amazonaws.com"
      },
      "Action": [
        "s3:PutObjectAcl",
        "s3:PutObject",
        "s3:ListMultipartUploadParts",
        "s3:ListBucketMultipartUploads",
        "s3:GetBucketAcl",
        "s3:AbortMultipartUpload"
      ],
      "Resource": [
        "arn:aws:s3:::engagement-uat-sfmc-snowflake-dpp/*",
        "arn:aws:s3:::engagement-uat-sfmc-snowflake-dpp"
      ]
    }
  ]
}
POLICY
}
