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
