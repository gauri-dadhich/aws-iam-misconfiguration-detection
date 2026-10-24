# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 33.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_33"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::ACCOUNTID:role/EC2_ROLE_4"
      },
      "Action": "es:ESHttp*",
      "Resource": [
        "arn:aws:es:REGION:ACCOUNTID:domain/DOMAIN/index3/*",
        "arn:aws:es:REGION:ACCOUNTID:domain/DOMAIN/index4/*"
      ],
      "Sid": "statement1"
    }
  ]
}
POLICY
}
