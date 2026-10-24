# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 85.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_85"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EC2DescribeInstances",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceConnectEndpoints"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "EC2InstanceConnect",
      "Action": [
        "ec2-instance-connect:SendSSHPublicKey",
        "ec2-instance-connect:OpenTunnel",
        "ec2-instance-connect:SendSerialConsoleSSHPublicKey",
        "ec2:CreateInstanceConnectEndpoint",
        "ec2:CreateNetworkInterface",
        "ec2:CreateTags",
        "iam:CreateServiceLinkedRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
POLICY
}
