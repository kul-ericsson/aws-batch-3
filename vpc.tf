resource "aws_vpc" "kul_vpc" {
 cidr_block = "10.0.0.0/16" 
 instance_tenancy = "default"
 enable_dns_support = "true"
 enable_dns_hostnames = "true"
 tags = {
     Name = "${var.tagname}_vpc"
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

resource "aws_internet_gateway" "gw" {
	vpc_id = aws_vpc.kul_vpc.id
	tags = {
		Name = "${var.tagname}_internet_gateway"
	}
}

resource "aws_route_table" "rt1" {
	vpc_id = aws_vpc.kul_vpc.id
	tags = {
		Name = "${var.tagname}_Public_RT"
	}
    route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.gw.id
	}
}

resource "aws_route_table_association" "association_public_subnet" {
	subnet_id = aws_subnet.public_sn.id
	route_table_id = aws_route_table.rt1.id
}

resource "aws_security_group" "kul_sg" {
    name = "${var.tagname}_Security_Group"
    description = "Managed by Terraform Project by Kul"
    vpc_id = aws_vpc.kul_vpc.id
    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH"
      from_port = 22
      to_port = 22
      protocol = "TCP"
    } ]
    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "All Open"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
    tags = {
      "Name" = "${var.tagname}_Security_Group"
    }
}