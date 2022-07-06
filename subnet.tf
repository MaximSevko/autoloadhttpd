
resource "aws_subnet" "subnet_public" {
    for_each = var.availability_zones

    vpc_id = "${aws_vpc.main.id}"


    availability_zone = each.key
    cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, each.value)
    ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, each.value + 6)


 
    map_public_ip_on_launch = "true" //it makes this a public subnet
    assign_ipv6_address_on_creation = true

    tags = {
        Name = "subnet-public-${each.value}"
            owner = "Maxim"
    }
}

resource "aws_subnet" "subnet_private" {
    for_each = var.availability_zones

    vpc_id = "${aws_vpc.main.id}"

    availability_zone = each.key
    cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, each.value + 10)

    map_public_ip_on_launch = "true" //it makes this a private subnet

    tags = {
        Name = "subnet-private-${each.value + 10}"
        owner = "Maxim"
    }
}
