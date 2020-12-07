resource "mysql_database" "kul"{
	name = "kul_db"
}

resource "mysql_user" "dbuser" {
	user = "kmayer"
	plaintext_password = "india@123"
	host = aws_instance.kul_server.private_ip
}

resource "mysql_grant" "dbgrant" {
	user = mysql_user.dbuser.user
	host = mysql_user.dbuser.host
	database = mysql_database.kul.name
	privileges = ["SELECT","UPDATE","INSERT","CREATE","DROP","DELETE"]
}