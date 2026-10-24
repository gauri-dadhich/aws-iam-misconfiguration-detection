# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 261.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_261"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "AlarmAction",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.alarms.cloudwatch.amazonaws.com"
      },
      "Action": "lambda:InvokeFunction",
      "Resource": "arn:aws:lambda:us-east-1:account_b:function:alarmActionLambda",
      "Condition": {
        "StringEquals": {
          "AWS:SourceAccount": "account_a"
        },
        "StringLike": {
          "AWS:SourceArn": "arn:aws:cloudwatch:us-east-1:account_a:alarm:canary alarm"
        }
      }
    }
  ]
}
POLICY
}
