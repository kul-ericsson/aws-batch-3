resource "null_resource" "configure_system" {
  depends_on = [ aws_instance.kul_server,aws_db_instance.kul_db ]
  provisioner "remote-exec" {
      connection {
          type = "ssh"
          user = "centos"
          host = aws_instance.kul_server.public_ip
          private_key = file("C:/training/ericsson/aws/batch-3/kul-ericsson.pem")
      }
      inline = [
          "sudo yum install -y mysql nfs-utils",
          "sudo mkdir /data",
          "sudo mkfs /dev/xvdb && sudo mount /dev/xvdb /data"
      ]
  }
}