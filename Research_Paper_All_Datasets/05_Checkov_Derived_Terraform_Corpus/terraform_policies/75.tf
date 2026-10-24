# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 75.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_75"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "aws-portal:ViewBilling",
      "Resource": "*",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": "sustainability:GetCarbonFootprintSummary",
      "Resource": "*",
      "Sid": "statement2"
    }
  ]
}
POLICY
}
