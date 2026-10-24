# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 84.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_84"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowRootLevelListingOfBucket",
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::my-bucket"
      ],
      "Condition": {
        "StringEquals": {
          "s3:prefix": [
            ""
          ],
          "s3:delimiter": [
            "/"
          ]
        }
      }
    },
    {
      "Sid": "AllowSubFolderListing",
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::my-bucket"
      ],
      "Condition": {
        "StringEquals": {
          "s3:prefix": [
            "users/",
            "users/chris/"
          ],
          "s3:delimiter": [
            "/"
          ]
        }
      }
    },
    {
      "Sid": "AllowSubFolderReadAccess",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::my-bucket/users/chris/*"
    }
  ]
}
POLICY
}
