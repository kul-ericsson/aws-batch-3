resource "aws_vpc" "kul_vpc" {
 cidr_block = "10.0.0.0/16" 
 instance_tenancy = "default"
 enable_dns_support = "true"
 enable_dns_hostnames = "true"
 tags = {
     Name = var.tagname
 }
}

resource "aws_subnet" "public_sn" {
  vpc_id = aws_vpc.kul_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "${var.tagname}_public_sn"
  }
}

resource "aws_subnet" "private_sn_1" {
  vpc_id = aws_vpc.kul_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  tags = {
    "Name" = "${var.tagname}_private_sn_1"
  }
}

resource "aws_subnet" "private_sn_2" {
  vpc_id = aws_vpc.kul_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  tags = {
    "Name" = "${var.tagname}_private_sn_2"
  }
}