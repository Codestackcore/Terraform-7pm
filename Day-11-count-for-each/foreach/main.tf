variable "env" {
  type = list(string)
  default =["dev","prod"]
}


resource "aws_instance" "name" {
  ami = "ami-0a59ec92177ec3fad"
  instance_type = "t2.micro"
  for_each = toset(var.env) # toset not follows any oder like list (index)
  tags ={
    Name = each.value
  }
}