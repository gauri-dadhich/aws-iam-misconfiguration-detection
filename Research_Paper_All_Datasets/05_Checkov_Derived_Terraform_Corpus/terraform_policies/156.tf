# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 156.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_156"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "kms:Decrypt"
      ],
      "Resource": [
        "arn:aws:s3:::test-bucket-mis6389/evdata/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
