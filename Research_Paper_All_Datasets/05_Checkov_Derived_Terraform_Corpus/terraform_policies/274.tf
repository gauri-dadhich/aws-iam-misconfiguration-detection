# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 274.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_274"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "Policy1408118342443",
  "Statement": [
    {
      "Sid": "Stmt1408118336209",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::owrvideos/*",
      "Condition": {
        "StringLike": {
          "aws:Referer": [
            "MY FIRST DOMAIN/*",
            " MY NEW DOMAIN/*"
          ]
        }
      }
    }
  ]
}
POLICY
}
