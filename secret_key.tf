resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "generated_key" {
  key_name   = "test"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret" "example2" {
  name = "example2"
}

resource "aws_secretsmanager_secret_version" "test_secret" {
  secret_id     = "${aws_secretsmanager_secret.example2.id}"
  secret_string = "${tls_private_key.key.private_key_pem}"

}

resource "local_file" "foo" {
    content     = "${tls_private_key.key.private_key_pem}"
    filename = "test.pem"
}