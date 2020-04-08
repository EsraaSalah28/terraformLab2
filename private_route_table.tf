resource "aws_route_table" "private_route" {
    vpc_id = "${aws_vpc.myvpc.id}"

    tags {
        Name = "private Subnet"
    }
}

resource "aws_route_table_association" "private_rt_association" {
    subnet_id = "${aws_subnet.private_sub1.id}"
    subnet_id = "${aws_subnet.private_sub2.id}"
    route_table_id = "${aws_route_table.private_route.id}"
}