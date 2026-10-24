# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 51.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_51"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sns:Publish",
      "Resource": "arn:aws:sns:ap-south-1:xxxxxxxxx:AWSChatBot-Incident-Manager"
    },
    {
      "Sid": "IncidentManagerSNSPublishingPermissions",
      "Effect": "Allow",
      "Principal": {
        "Service": "ssm-incidents.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:ap-south-1:xxxxxxxxx:AWSChatBot-Incident-Manager"
    }
  ]
}
POLICY
}
