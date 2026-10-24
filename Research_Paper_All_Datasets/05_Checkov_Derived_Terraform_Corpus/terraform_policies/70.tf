# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 70.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_70"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:PassRole",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:AttachRolePolicy"
      ],
      "Resource": "arn:aws:iam::1234:policy/AmazonBedrockS3PolicyForKnowledgeBase_xyz"
    }
  ]
}
POLICY
}
