resource "aws_instance" "nginx_1" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = "${aws_subnet.public_sub1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]
  tags = {
    Name = "nginx 1"
  }
}

resource "aws_instance" "nginx_2" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = "${aws_subnet.public_sub2.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]
  tags = {
    Name = "nginx 2"
  }
}

resource "aws_instance" "bastion" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = "${aws_subnet.public_sub1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "web_1" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = "${aws_subnet.private_sub1.id}"
  tags = {
    Name = "web 1"
  }

}

resource "aws_instance" "web_2" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = "${aws_subnet.private_sub2.id}"
  tags = {
    Name = "web 2"
  }

}