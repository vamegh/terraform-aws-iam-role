terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  region = "eu-west-1"
}

# Example IAM role
module "iam_role" {
  source = "../"
  name   = "dp-dl-test-role"

  allow_service = "glue.amazonaws.com"

  //  allow_arn = [
  //    "arn:aws:iam::047625233815:user/netf"
  //  ]
  //  allow_service = [
  //    "ec2.amazonaws.com"
  //  ]
  //  assume_role = [
  //    "arn:aws:iam::988339453305:role/user-cradu",
  //    "arn:aws:iam::047625233815:user/netf"
  //  ]

  s3_read = [
    "dp-datalake-test-bucket",
    "dp-datalake-test-bucket2",
  ]

  //  s3_write = [
  //    "dp-datalake-test-bucket"
  //  ]

  //  policy_inline = <<EOF
  //  {
  //          "Version": "2012-10-17",
  //          "Statement": [{
  //                  "Effect": "Allow",
  //                  "Action": [
  //                    "s3:Get*",
  //                    "s3:List*"
  //                  ],
  //                  "Resource": [
  //                          "arn:aws:s3:::inline-test-bucket",
  //                          "arn:aws:s3:::inline-test-bucket/*"
  //                  ]
  //          }]
  //  }
  //  EOF
  //
  policy_file = [
    "policies/test-bucket-policy.json",
    "policies/test-bucket-policy.json",
  ]

  //  policy_managed = [
  //    "AmazonAthenaFullAccess",
  //    "AmazonEC2FullAccess"
  //  ]

  tags = {
    Platform    = "DP"
    Project     = "test"
    Owner       = "test"
    Environment = "datalake"
  }
}

