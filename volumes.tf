resource "aws_ebs_volume" "kul_volume" {
 availability_zone = "us-east-2a"
 size = 10
 tags = {
     Name = "${var.tagname}_Volume"
 } 
}