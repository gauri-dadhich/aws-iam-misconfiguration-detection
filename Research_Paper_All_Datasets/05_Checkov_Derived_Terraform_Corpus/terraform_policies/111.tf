# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 111.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_111"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "PolicyForWebsiteAccess",
  "Statement": [
    {
      "Sid": "AllowWebsiteAccessForViewing",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::mybucket/*",
      "Condition": {
        "StringLike": {
          "aws:Referer": [
            "https://example.com/*",
            "https://example.com"
          ]
        }
      }
    },
    {
      "Sid": "AllowWebsiteAccessForUploads",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::mybucket/*",
      "Condition": {
        "StringLike": {
          "aws:Referer": [
            "https://example.com/*",
            "https://example.com"
          ]
        }
      }
    }
  ]
}
POLICY
}
