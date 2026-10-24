# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 235.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_235"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "RestrictVPCPeering",
      "Effect": "Deny",
      "Action": "ec2:CreateVpcPeeringConnection",
      "Resource": "*",
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalOrgPaths": "o-abcdef/r-1234/ou-1234-abc5678/"
        }
      }
    }
  ]
}
POLICY
}
