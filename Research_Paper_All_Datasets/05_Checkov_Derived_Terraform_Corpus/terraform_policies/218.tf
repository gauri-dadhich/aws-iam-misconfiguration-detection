# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 218.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_218"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Condition": {
        "StringLike": {
          "aws:PrincipalTag/companyRoles": [
            "*${aws:ResourceTag/companyId}:admin*",
            "*${aws:ResourceTag/companyId}:member*"
          ]
        }
      },
      "Action": [
        "kinesisvideo:GetMedia",
        "kinesisvideo:GetClip",
        "kinesisvideo:ListFragments",
        "kinesisvideo:GetDataEndpoint",
        "kinesisvideo:DescribeStream",
        "kinesisvideo:GetHLSStreamingSessionUrl",
        "kinesisvideo:GetImages"
      ],
      "Resource": "arn:aws:kinesisvideo:us-east-2:000011112222:stream/*",
      "Effect": "Allow",
      "Sid": "statement1"
    }
  ]
}
POLICY
}
