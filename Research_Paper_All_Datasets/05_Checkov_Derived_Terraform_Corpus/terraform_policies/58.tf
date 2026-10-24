# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 58.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_58"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:StartBuild",
        "codebuild:BatchGetBuilds",
        "codecommit:GitPull"
      ],
      "Resource": [
        "arn:aws:codebuild:*:*:project/*",
        "arn:aws:codecommit:*:*:*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
