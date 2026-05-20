resource "aws_instance" "name" {
  ami           = "ami-0a59ec92177ec3fad"
  instance_type = "var.instance_type"

}


