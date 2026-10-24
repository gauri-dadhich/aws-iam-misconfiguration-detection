# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 31.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_31"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "awssnowpipebucket_publish",
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:ap-southeast-1:406745342818:snowpipe_topic"
    }
  ]
}
POLICY
}
