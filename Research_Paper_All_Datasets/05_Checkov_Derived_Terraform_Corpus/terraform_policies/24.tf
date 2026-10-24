# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 24.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_24"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kms:us-east-2:<account_id>key/<key_id>",
      "Sid": "kms"
    },
    {
      "Action": "secretsmanager:GetSecretValue",
      "Effect": "Allow",
      "Resource": "arn:aws:secretsmanager:us-east-2:<account_id>:secret:<secret_name>-<some_randomstuff>",
      "Sid": "secretsmanager"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
