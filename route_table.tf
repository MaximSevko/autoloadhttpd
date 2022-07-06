
resource "aws_route_table" "public-rt" {
    vpc_id = "${aws_vpc.main.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.igw.id}" 
    }
    
    tags = {
        Name = "public-rt"    
        owner = "Maxim"
    }
}

resource "aws_route_table_association" "rta-public-subnet"{
#    count = length(aws_subnet.subnet_public)
    for_each = var.availability_zones

#    subnet_id = aws_subnet.subnet_public[count.index].id
    subnet_id = aws_subnet.subnet_public[each.key].id
    route_table_id = "${aws_route_table.public-rt.id}"
}
