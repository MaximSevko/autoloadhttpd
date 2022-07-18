variable "AMI1" {
    type = map
    default = {
        AmazonLinux = "ami-07cd3675e7ca644fe"
        Ubuntu = "ami-0641bed8c0ce71686"
    }
}

variable "AWS_Region" {
    default = "eu-north-1"
}

variable "instance_type" {
    default = "t4g.micro"
}

variable "vpc_cidr_block" {
    default = "10.12.0.0/16"
}

variable "availability_zones" { 
    default = {
        eu-north-1a = 11
        eu-north-1b = 12
        eu-north-1c = 13
    }
}

variable "web_key_name" {
    default = "maxkey"
}
 