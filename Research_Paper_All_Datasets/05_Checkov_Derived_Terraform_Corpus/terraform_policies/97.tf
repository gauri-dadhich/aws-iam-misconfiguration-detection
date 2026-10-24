# Auto-generated research wrapper for Checkov comparison.
# Source: CloudFix/fixmypolicy real-world AWS IAM policy 97.json
# The policy JSON below is preserved from the source policy.
resource "aws_iam_policy" "policy" {
  name   = "cloudfix_policy_97"
  path   = "/"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "ExampleAccessPointPolicy",
  "Statement": [
    {
      "Sid": "statement1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::593793065716:role/aws-service-role/s3-outposts.amazonaws.com/AWSServiceRoleForS3OnOutposts"
      },
      "Action": "s3-outposts:*",
      "Resource": "arn:aws:s3-outposts:us-west-2:593793065716:outpost/op-06d594d204174c310/accesspoint/a207804-ci-outpost-bucket1-access-point"
    }
  ]
}
POLICY
}
