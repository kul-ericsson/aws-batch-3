output "kul_server_public_ip" {
  value = "Public IP is ${aws_instance.kul_server.public_ip}"
}

output "kul_db_endpoint" {
  value = aws_db_instance.kul_db.endpoint
}