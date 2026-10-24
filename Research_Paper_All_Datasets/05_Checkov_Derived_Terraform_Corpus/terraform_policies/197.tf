# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 197.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_197"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowVpcEndpoint",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::great-expectations-docs",
        "arn:aws:s3:::great-expectations-docs/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:sourceVpce": "vpce-0c0f4bb767f820bda"
        }
      }
    }
  ]
}
POLICY
}
