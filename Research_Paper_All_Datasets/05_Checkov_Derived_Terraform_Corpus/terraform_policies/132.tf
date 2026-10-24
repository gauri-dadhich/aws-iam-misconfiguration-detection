# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 132.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_132"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "cognito-identity:GetCredentialsForIdentity",
        "evidently:EvaluateFeature"
      ],
      "Resource": [
        "*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
