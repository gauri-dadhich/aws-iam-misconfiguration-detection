# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 44.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_44"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "airflow:InvokeRestApi"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:airflow:us-west-2:{account-redacted}:environment/{airflow-env-redacted}/Admin",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
