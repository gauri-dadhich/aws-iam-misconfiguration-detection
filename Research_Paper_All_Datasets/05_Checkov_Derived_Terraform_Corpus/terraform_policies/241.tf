# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 241.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_241"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::652711504416:root"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::myfirstbucket/prefix/AWSLogs/1111111111/*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
