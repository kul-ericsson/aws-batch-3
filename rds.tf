resource "aws_db_subnet_group" "kul_subnet_group" {
  name = "${var.tagname}_subnet_group"
  subnet_ids = [ aws_subnet.public_sn.id, aws_subnet.private_sn_1.id, aws_subnet.private_sn_2.id ]
  tags = {
    "Name" = "${var.tagname}_subnet_group"
  }
}

resource "aws_db_instance" "kul_db" {
    allocated_storage = 10
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.20"
    instance_class = "db.t2.micro"
    name = "${var.tagname}_db"
    username = "admin"
    password = "admin123"
    identifier = "kul-db"
    availability_zone = var.availability_zone_private
    db_subnet_group_name = aws_db_subnet_group.kul_subnet_group.id
    publicly_accessible = "false"
    skip_final_snapshot = "true"
}