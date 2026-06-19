resource "aws_instance" "name" {
   ami = "ami-0521cb2d60cfbb1a67"
   instance_type = "t3.micro"
   tags = {
     Name = "dev"
   }

   #lifecycle {
   # prevent_destroy = true
   # }
   # lifecycle {
   #   ignore_change = [instance_type,]
   # }
   lifecycle {
     create_before_destroy = true
   }
}