# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 213.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_213"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "external user arn permissioned get object",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::555555555555:user/external"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::shared-bucket/*"
    }
  ]
}
POLICY
}
