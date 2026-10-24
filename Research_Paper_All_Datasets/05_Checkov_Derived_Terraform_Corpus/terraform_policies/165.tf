# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 165.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_165"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "organizations:UntagResource",
        "organizations:TagResource"
      ],
      "Condition": {
        "StringLike": {
          "aws:ResourceOrgPaths": [
            "o-xxxxx/r-eihy/ou-eihy-xihtvxxx/ou-eihy-3ku70xxx/*",
            "o-xxxxx/r-eihy/ou-eihy-xihtvxxx/ou-eihy-3ku7xxx/",
            "o-xxxxx/r-eihy/ou-eihy-xihtvxxxx/ou-eihy-3ku70xxx",
            "*ou-eihy-3ku70yzx*"
          ]
        }
      },
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
