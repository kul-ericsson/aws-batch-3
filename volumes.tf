resource "aws_ebs_volume" "kul_volume" {
 availability_zone = var.availability_zone
 size = 10
 tags = {
     Name = "${var.tagname}_Volume"
 } 
}

resource "aws_volume_attachment" "kul_volume_attachment" {
  volume_id = aws_ebs_volume.kul_volume.id
  instance_id = aws_instance.kul_server.id
  device_name = "/dev/sdb"
  skip_destroy = "true"
}