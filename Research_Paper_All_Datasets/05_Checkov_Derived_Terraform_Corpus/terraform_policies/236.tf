# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 236.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_236"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "*",
      "Resource": [
        "arn:aws:s3:::BUCKET_NAME",
        "arn:aws:s3:::BUCKET_NAME/*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:DataAccessPointAccount": "ACCOUNT_ID"
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
