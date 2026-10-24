# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 201.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_201"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "DenyanyEC2operationSCP1",
      "Effect": "Deny",
      "Action": [
        "ec2:RunInstances"
      ],
      "Resource": [
        "arn:aws:ec2:*:*:instance/*",
        "arn:aws:ec2:*:*:volume/*"
      ],
      "Condition": {
        "StringLike": {
          "aws:RequestTag/Name": "true"
        }
      }
    },
    {
      "Sid": "DenyanyEC2operationSCP2",
      "Effect": "Deny",
      "Action": [
        "ec2:RunInstances"
      ],
      "Resource": [
        "arn:aws:ec2:*:*:instance/*",
        "arn:aws:ec2:*:*:volume/*"
      ],
      "Condition": {
        "StringLike": {
          "aws:RequestTag/Team": "true"
        }
      }
    },
    {
      "Sid": "PreventTagRemoval",
      "Effect": "Deny",
      "Action": "ec2:DeleteTags",
      "Resource": [
        "arn:aws:ec2:*:*:instance/*",
        "arn:aws:ec2:*:*:volume/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:TagKeys": [
            "Name",
            "Team"
          ]
        },
        "StringNotEqualsIfExists": {
          "aws:ResourceTag/AllowTagRemoval": "true"
        }
      }
    }
  ]
}
POLICY
}
