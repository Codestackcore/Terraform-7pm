variable "create_ec2" {
    type = bool
    default = false
}

resource "aws_instance" "app" {
  count = var.create_ec2 ? 1 : 0

  ami = "ami-0a59ec92177ec3fa"
  instance_type = "t2.micro" 
}


variable "azs" {
    default = ["ap-south-1a","ap-south-1b"]
  
}

resource "aws_subnet" "Public" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public-${count.index}"
  }
  
}