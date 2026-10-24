# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 18.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_18"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iotsitewise:BatchPutAssetPropertyValue",
      "Resource": [
        "arn:aws:iotsitewise:eu-west-1:907963324750:asset/_"
      ],
      "Sid": "statement1"
    },
    {
      "Effect": "Allow",
      "Action": "iotsitewise:BatchPutAssetPropertyValue",
      "Resource": "arn:aws:iotsitewise:eu-west-1:907963324750:time-series/*",
      "Condition": {
        "StringLike": {
          "iotsitewise:propertyAlias": [
            "/lorawan/${topic(3)}/snr",
            "/lorawan/${topic(3)}/frequency",
            "/lorawan/${topic(3)}/rssi"
          ]
        }
      },
      "Sid": "statement2"
    }
  ]
}
POLICY
}
