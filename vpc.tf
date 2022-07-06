
provider "aws" {
  region = var.AWS_Region
}


resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  assign_generated_ipv6_cidr_block = "true"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    owner = "Maxim"
  }
}


resource "aws_iam_role" "test_role" {
    name = "test_role"
  
    # Terraform's "jsonencode" function converts a
    # Terraform expression result to valid JSON syntax.
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
        # CloudWatch policy
      "Effect":"Allow",
      "Action":["cloudwatch:GetMetricData","cloudwatch:ListMetrics",],
      "Resource":"*",
      "Condition":{
         "Bool":{
            "aws:SecureTransport":"true"
            }
         }
      },
      # SSM Agent policy
              {
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::aws-ssm-region/*",
                "arn:aws:s3:::aws-windows-downloads-region/*",
                "arn:aws:s3:::amazon-ssm-region/*",
                "arn:aws:s3:::amazon-ssm-packages-region/*",
                "arn:aws:s3:::region-birdwatcher-prod/*",
                "arn:aws:s3:::aws-ssm-distributor-file-region/*",
                "arn:aws:s3:::aws-ssm-document-attachments-region/*",
                "arn:aws:s3:::patch-baseline-snapshot-region/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl", 
                "s3:GetEncryptionConfiguration" 
            ],
            "Resource": [
                "arn:aws:s3:::DOC-EXAMPLE-BUCKET/*",
                "arn:aws:s3:::DOC-EXAMPLE-BUCKET" 
            ]
        },
      ]
    })
  
    tags = {
      tag-key = "tag-value"
    }
  }

resource "aws_cloudwatch_log_group" "MaximLogs" {
  name = "MaximLogs"

  tags = {
    Owner = "Maxim"
  }
}