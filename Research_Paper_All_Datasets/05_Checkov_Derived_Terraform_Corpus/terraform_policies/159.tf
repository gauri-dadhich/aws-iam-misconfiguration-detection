# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 159.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_159"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "execute-api:Invoke",
      "Resource": "arn:aws:execute-api:eu-central-1:012345678901:someid/prod/POST/resource",
      "Condition": {
        "StringEquals": {
          "aws:ResourceOrgPaths": "o-orgid/r-rootid/ou-firstlevel/ou-secondlevel"
        }
      },
      "Sid": "statement1"
    }
  ]
}
POLICY
}
