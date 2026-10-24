# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 107.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_107"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyEC2AuxilliaryInfraOwnerTag",
      "Effect": "Deny",
      "Action": [
        "autoscaling:CreateAutoScalingGroup"
      ],
      "Resource": [
        "arn:aws:autoscaling:*:*:autoScalingGroup/*"
      ]
    }
  ]
}
POLICY
}
