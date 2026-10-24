# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 250.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_250"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "UpdateShadows",
      "Effect": "Allow",
      "Action": [
        "iot:UpdateThingShadow",
        "iot:ListNamedShadowsForThing",
        "iot:GetThingShadow"
      ],
      "Resource": "arn:aws:iot:[region]:[account]:thing/*"
    }
  ]
}
POLICY
}
