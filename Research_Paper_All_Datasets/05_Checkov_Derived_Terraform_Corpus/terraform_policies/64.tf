# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 64.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_64"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1706347165594",
  "Statement": [
    {
      "Sid": "Stmt1706347164281",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::<bucket-name>/*"
    }
  ]
}
POLICY
}
