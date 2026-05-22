resource "aws_instance" "name" {
  ami                  = "ami-0236922087fa98b6e"
  instance_type        = "t2.micro"
  tags = {
    Name = "qa"
  }


}

resource "aws_s3_bucket" "dev" {
    bucket = "hjiolkikdrsrtjuiuiu"
}

  