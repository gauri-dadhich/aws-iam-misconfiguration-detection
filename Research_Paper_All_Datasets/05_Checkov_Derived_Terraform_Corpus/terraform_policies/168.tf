# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 168.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_168"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AlexTestPolicy",
      "Effect": "Allow",
      "Action": [
        "ec2:StartInstances"
      ],
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:PrincipalTag/Division": "*${ec2:ResourceTag/Division}*"
        }
      }
    }
  ]
}
POLICY
}
