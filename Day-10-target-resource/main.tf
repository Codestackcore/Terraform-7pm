resource "aws_instance" "name" {
   ami = "ami-0521cb2d60cfbb1a6"
   instance_type = "t3.micro"
   tags = {
     Name = "dev"
   }
}


resource "aws_s3_bucket" "name" {
    bucket = "nareshit-devops-devvv"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Enabled"
  }
}


#terraform apply -target=aws_s3_bucket.name to apply specific resource
#terraform destory -target=aws_s3_bucket.name