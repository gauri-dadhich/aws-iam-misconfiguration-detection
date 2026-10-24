# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 86.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_86"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sqs:GetQueueAttributes",
        "sqs:ListQueues",
        "sqs:SendMessage",
        "tag:GetResources",
        "iam:GetRole",
        "kms:GenerateDataKey"
      ],
      "Resource": "arn:aws:sqs:us-east-1:<account_of_sqs(current_account)>:prisma-que",
      "Effect": "Allow",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
