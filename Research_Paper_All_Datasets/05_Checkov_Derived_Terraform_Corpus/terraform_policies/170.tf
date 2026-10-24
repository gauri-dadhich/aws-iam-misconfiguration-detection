# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 170.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_170"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kms:ReEncrypt*",
        "kms:GetKeyPolicy",
        "kms:GenerateDataKey*",
        "kms:Encrypt",
        "kms:DescribeKey",
        "kms:Decrypt",
        "kms:CreateGrant"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kms:us-east-1:<account id>:key/<key for bucketA>",
      "Sid": "KMSUsage"
    }
  ]
}
POLICY
}
