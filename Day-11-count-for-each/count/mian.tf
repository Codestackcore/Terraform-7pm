# resource "aws_instance" "name" {
#   ami = "ami-0a59ec92177ec3fad"
#   instance_type = "t3.mirco"
#   count = 2
#   # tags = {
#   # Name = "dev"
#   # }
#  tags = {
#    Name = "dev-${count.index}"
#  }
#  }

variable "env" {
  type = list(string)
  default =["dev","prod"]
}


resource "aws_instance" "name" {
  ami = "ami-0a59ec92177ec3fad"
  instance_type = "t2.micro"
  count = length(var.env)
  tags ={
    Name = var.env[count.index]
  }
}