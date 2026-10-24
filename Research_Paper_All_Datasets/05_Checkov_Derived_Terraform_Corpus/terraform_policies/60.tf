# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 60.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_60"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "route53:ChangeResourceRecordSetsRecordTypes": [
            "A",
            "AAAA"
          ]
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
