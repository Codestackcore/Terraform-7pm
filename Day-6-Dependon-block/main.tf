resource "aws_instance" "name" {
    ami = "ami-0236922087fa98b6e"
    instance_type = "t2.micro"
}


resource "aws_s3_bucket" "name" {
    bucket = "iadjfnfjaks"
    depends_on = [ aws_instance.name ]
}