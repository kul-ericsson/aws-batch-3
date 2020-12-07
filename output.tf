output "kul_server_public_ip" {
  value = "Public IP is ${aws_instance.kul_server.public_ip}"
}