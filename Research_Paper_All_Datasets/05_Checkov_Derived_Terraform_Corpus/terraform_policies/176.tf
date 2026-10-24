# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 176.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_176"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sagemaker:CreateInferenceComponent"
      ],
      "Resource": [
        "arn:aws:sagemaker:*:xx:endpoint/*",
        "arn:aws:sagemaker:*:xx:inference-component/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
