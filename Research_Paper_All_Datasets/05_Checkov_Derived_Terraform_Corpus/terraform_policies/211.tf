# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 211.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_211"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "SESPermissionPolicy",
  "Statement": [
    {
      "Sid": "AllowSESPolicy",
      "Effect": "Allow",
      "Principal": {
        "Service": "ses.amazonaws.com"
      },
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::mybucket/*",
      "Condition": {
        "StringEquals": {
          "aws:Referer": "domain"
        }
      }
    },
    {
      "Sid": "AllowSESReceiveEmails",
      "Effect": "Allow",
      "Principal": {
        "Service": "ses.amazonaws.com"
      },
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::mybucket/*",
      "Condition": {
        "StringEquals": {
          "aws:Referer": "domain"
        },
        "StringLike": {
          "aws:Referer": "copied arn email@domain"
        }
      }
    }
  ]
}
POLICY
}
