# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 214.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_214"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:Get*"
      ],
      "Resource": "arn:aws:s3:::Bucket-Name/*"
    }
  ]
}
POLICY
}
