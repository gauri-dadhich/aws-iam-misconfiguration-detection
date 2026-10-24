# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 181.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_181"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSKafkaResourcePolicy",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::{ourAccountId}:root",
        "Service": "kafka.amazonaws.com"
      },
      "Action": [
        "secretsmanager:getSecretValue",
        "secretsmanager:DescribeSecret"
      ],
      "Resource": "arn:aws:secretsmanager:eu-central-1:{mskAccId}:secret:AmazonMSK_eos-datapipeline-ads-all-prod-12345"
    }
  ]
}
POLICY
}
