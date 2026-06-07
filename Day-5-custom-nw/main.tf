#Creation of VPC
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
     Name = "dev"
    }


}
#Creation of subnets
resource "aws_subnet" "dev" {

   vpc_id = aws_vpc.name.id
   cidr_block = "10.0.0.0/24"
   availability_zone = "us-east-1a"
   tags = {
     Name = "dev-public"
   }
}

resource "aws_subnet" "test" {
    
   vpc_id = aws_vpc.name.id
   cidr_block = "10.0.1.0/24"
   availability_zone = "us-east-1b"
   tags = {
     Name = "test"
   }
}

#IG creation 

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
  
}

 resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id

    }
 }

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.name.id
}

#create private RT
#create Nat gateway
#subnet assoication to private subnet

resource "aws_security_group" "dev_sg" {
  name   = "allow_tls"
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "dev-sg"
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "name" {
  ami = "ami-0a59ec92177ec3fad"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.dev.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
}