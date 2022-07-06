
resource "aws_security_group" "webserver" {
    vpc_id = "${aws_vpc.main.id}"
    name = "Webserver"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH port"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        ipv6_cidr_blocks = ["::/0"]
        description = "SSH port"
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP port"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
        description = "HTTP port"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTPS port"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
        description = "HTTPS port"
    }
    tags = {
        Name = "webserver"
        owner = "Maxim"
    }
}
