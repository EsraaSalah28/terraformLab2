
resource "aws_subnet" "public_sub1" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.1.0/25"
  map_public_ip_on_launch = true

  availability_zone =  "us-west-2a"
  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public_sub2" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.2.0/25"
  map_public_ip_on_launch = true

  availability_zone =  "us-west-2b"
  tags = {
    Name = "public subnet 2"
  }
}

resource "aws_subnet" "private_sub1" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.3.0/25"
  availability_zone =  "us-west-2a"
  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private_sub2" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.4.0/25"
  availability_zone =  "us-west-2b"
  tags = {
    Name = "private subnet 2"
  }
}