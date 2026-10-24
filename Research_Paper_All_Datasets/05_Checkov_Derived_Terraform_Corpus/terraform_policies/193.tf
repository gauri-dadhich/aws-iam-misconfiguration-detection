# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 193.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_193"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CancelExportTask",
        "logs:DescribeExportTasks",
        "logs:DescribeLogStreams",
        "logs:DescribeLogGroups",
        "logs:CreateExportTask",
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject",
        "s3:GetBucketAcl"
      ],
      "Resource": "",
      "Effect": "Allow",
      "Sid": "statement1"
    },
    {
      "Action": [
        "kms:GenerateDataKey",
        "kms:Decrypt"
      ],
      "Resource": "",
      "Effect": "Allow",
      "Sid": "statement2"
    }
  ]
}
POLICY
}
