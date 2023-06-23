resource "aws_key_pair" "keypair" {
  key_name   = "${var.vpc_name}-key-pair"
  public_key = file(var.ssh_key_pair)
}
