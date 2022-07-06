
resource "aws_instance" "amazonlinux" {
    #for_each = var.availability_zones

    ami = "${lookup(var.AMI1, "AmazonLinux")}"
    instance_type = var.instance_type
    # VPC
    subnet_id = aws_subnet.subnet_public["eu-central-1a"].id
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
    # the Public SSH key
    key_name = var.web_key_name
    user_data = file("autoload")
    #iam_instance_profile = aws_iam_role.test_role
    tags = {
        Name = "AmazonLinux"
        owner = "Maxim"
    }
}

#resource "aws_instance" "ubuntu" {
#    #for_each = var.availability_zones
#    ami = "${lookup(var.AMI1, "Ubuntu")}"
#    instance_type = var.instance_type
#    # VPC
#    subnet_id = aws_subnet.subnet_public["eu-central-1b"].id
#    # Security Group
#    vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
#    # the Public SSH key
#    key_name = var.web_key_name
#        user_data = file("autoloadhttpdub")
#
#    tags = {
#        Name = "Ubuntu"
#        owner = "Maxim"
#    }
#
#}
#