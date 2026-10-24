# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 43.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_43"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "imagebuilder:GetComponent",
        "imagebuilder:ListComponents",
        "imagebuilder:GetComponentPolicy"
      ],
      "Resource": "arn:aws:imagebuilder:us-east-1::component///1",
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "arn:aws:s3:::-useast",
      "Sid": "statement2"
    }
  ]
}
POLICY
}
