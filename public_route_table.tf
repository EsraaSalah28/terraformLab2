resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.myvpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "public_rt_association1" {
    subnet_id = "${aws_subnet.public_sub1.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "public_rt_association2" {
    subnet_id = "${aws_subnet.public_sub2.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}