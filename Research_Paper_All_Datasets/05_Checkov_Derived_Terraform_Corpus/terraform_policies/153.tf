# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 153.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_153"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123:role/roletest1"
      },
      "Action": [
        "s3tables:GetTableData",
        "s3tables:GetTableMetadataLocation"
      ],
      "Resource": "arn:aws:s3tables:us-west-2:123:table-bucket/tabletest/table/*",
      "Condition": {
        "StringLike": {
          "s3tables:TableNamespace": "namesptest"
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
