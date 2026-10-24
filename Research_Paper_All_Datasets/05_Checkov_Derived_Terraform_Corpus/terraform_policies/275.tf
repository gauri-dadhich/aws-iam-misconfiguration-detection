# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 275.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_275"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": [
        "ec2:*"
      ],
      "Resource": "arn:aws:ec2:*:1234567890:*",
      "Condition": {
        "StringEquals": {
          "aws:PrincipalArn": "arn:aws:sts::1234567890:assumed-role/accounting-role-name/kalmesh@xyz.com"
        }
      }
    }
  ]
}
POLICY
}
