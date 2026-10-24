# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 83.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_83"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowLambdaCrossAccountAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::ACCOUNT_A:role/lambda_execution_role"
      },
      "Action": [
        "s3:GetObject*",
        "s3:GetBucket*",
        "s3:List*"
      ],
      "Resource": [
        "arn:aws:s3:::account_b_bucket_name",
        "arn:aws:s3:::account_b_bucket_name/*"
      ]
    },
    {
      "Sid": "AllowBedrockAccess",
      "Effect": "Allow",
      "Principal": {
        "Service": "bedrock.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::account_b_bucket_name/*",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "ACCOUNT_A"
        }
      }
    }
  ]
}
POLICY
}
