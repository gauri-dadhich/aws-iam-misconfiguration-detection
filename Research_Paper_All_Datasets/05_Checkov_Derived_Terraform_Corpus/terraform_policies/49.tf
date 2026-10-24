# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 49.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_49"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "glue:GetConnections",
        "glue:GetTables",
        "glue:GetTableVersions",
        "glue:GetDatabases",
        "glue:GetTable",
        "glue:GetDatabase",
        "glue:GetJob",
        "glue:StartJobRun",
        "glue:BatchStopJobRun",
        "glue:GetCrawler"
      ],
      "Resource": [
        "arn:aws:glue:*:248135293344:connection/*",
        "arn:aws:glue:*:248135293344:job/*",
        "arn:aws:glue:*:248135293344:database/glue*",
        "arn:aws:glue:*:248135293344:catalog",
        "arn:aws:glue:*:248135293344:table/glue*"
      ]
    }
  ]
}
POLICY
}
