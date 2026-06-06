terraform {
  backend "s3" {
    bucket = "syedabdulitdev"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
