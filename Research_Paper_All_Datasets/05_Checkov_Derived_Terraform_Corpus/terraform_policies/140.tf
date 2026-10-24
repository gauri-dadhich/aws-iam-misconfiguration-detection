# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 140.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_140"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": "ec2:RunInstances",
      "Resource": [
        "arn:aws:ec2:*:*:subnet/*",
        "arn:aws:ec2:*:*:key-pair/*",
        "arn:aws:ec2:*:*:security-group/*",
        "arn:aws:ec2:*:*:vpc/*",
        "arn:aws:ec2:*:*:instance/*",
        "arn:aws:ec2:*:*:network-interface/*",
        "arn:aws:ec2:*:*:volume/*",
        "arn:aws:ec2:us-east-1::image/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:ResourceTag/tkey": "tval"
        }
      }
    }
  ]
}
POLICY
}
