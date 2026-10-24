# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 244.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_244"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "es:DeleteOutboundConnection",
        "es:UpdateVpcEndpoint",
        "es:DeletePackage",
        "es:ListVpcEndpoints",
        "es:ListVpcEndpointsForDomain",
        "es:ListElasticsearchInstanceTypeDetails",
        "es:ListDomainsForPackage",
        "es:ListInstanceTypeDetails",
        "es:AuthorizeVpcEndpointAccess",
        "es:AcceptInboundConnection",
        "es:DeleteElasticsearchServiceRole",
        "es:DescribeInboundConnections",
        "es:DescribeOutboundConnections",
        "es:DescribeReservedInstances",
        "es:AcceptInboundCrossClusterSearchConnection",
        "es:DescribeReservedInstanceOfferings",
        "es:DescribeInstanceTypeLimits",
        "es:DescribeVpcEndpoints",
        "es:ListVpcEndpointAccess",
        "es:DeleteInboundCrossClusterSearchConnection",
        "es:DescribeOutboundCrossClusterSearchConnections",
        "es:DeleteOutboundCrossClusterSearchConnection",
        "es:DescribeReservedElasticsearchInstanceOfferings",
        "es:CreateServiceRole",
        "es:CreateElasticsearchServiceRole",
        "es:UpdatePackage",
        "es:RejectInboundCrossClusterSearchConnection",
        "es:DeleteInboundConnection",
        "es:GetPackageVersionHistory",
        "es:RejectInboundConnection",
        "es:PurchaseReservedElasticsearchInstanceOffering",
        "es:CreateVpcEndpoint",
        "es:DescribeInboundCrossClusterSearchConnections",
        "es:ListVersions",
        "es:DescribeReservedElasticsearchInstances",
        "es:ListDomainNames",
        "es:PurchaseReservedInstanceOffering",
        "es:CreatePackage",
        "es:DeleteVpcEndpoint",
        "es:DescribePackages",
        "es:ListElasticsearchInstanceTypes",
        "es:ListElasticsearchVersions",
        "es:DescribeElasticsearchInstanceTypeLimits",
        "es:RevokeVpcEndpointAccess"
      ],
      "Resource": "*"
    },
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": "es:*",
      "Resource": "arn:aws:es:xxxx:domain/project"
    }
  ]
}
POLICY
}
