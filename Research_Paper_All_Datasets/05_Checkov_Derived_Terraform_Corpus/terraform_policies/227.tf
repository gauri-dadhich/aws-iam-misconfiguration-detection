# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 227.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_227"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "arn:aws:sqs:eu-west-1:98xxxxx8745:undefined/SQSDefaultPolicy",
  "Statement": [
    {
      "Sid": "topic-subscription-arn:aws:sns:eu-west-1:98xxxxx8745:nocodebots",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SQS:SendMessage",
      "Resource": "arn:aws:sqs:eu-west-1:98xxxxx8745:nocodebots",
      "Condition": {
        "StringEquals": {
          "aws:SourceArn": "arn:aws:sns:eu-west-1:98xxxxx8745:nocodebots"
        }
      }
    }
  ]
}
POLICY
}
