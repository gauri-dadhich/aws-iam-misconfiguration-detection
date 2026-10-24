# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 128.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_128"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "glue:GetTable",
        "athena:StartQueryExecution",
        "athena:GetQueryResults",
        "athena:GetQueryExecution"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "Athena"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
