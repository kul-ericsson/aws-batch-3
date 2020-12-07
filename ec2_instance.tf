resource "aws_instance" "kul_server" {
  ami = "ami-01e36b7901e884a10"
  instance_type = "t2.micro"
  key_name = "kul-ericsson"
  tags = {
    "Name" = "${var.tagname}_Server"
  }
  subnet_id = aws_subnet.public_sn.id
  vpc_security_group_ids = [ aws_security_group.kul_sg.id ]
  availability_zone = var.availability_zone
}