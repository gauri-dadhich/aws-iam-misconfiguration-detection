# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 155.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_155"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "config:DeleteConfigurationRecorder",
        "config:DeleteDeliveryChannel",
        "config:DeleteRetentionConfiguration",
        "config:PutConfigurationRecorder",
        "config:PutDeliveryChannel",
        "config:PutRetentionConfiguration",
        "config:StopConfigurationRecorder"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Deny",
      "Sid": "GRCOXXXXXX"
    }
  ]
}
POLICY
}
