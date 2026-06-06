terraform {
  backend "s3" {
    bucket = "syedabdulitdev"
    key    = "day-4/terraform.tfstate"
    region = "us-east-1"
    encrypt      = true
    
    # Enables S3 Native State Locking (No DynamoDB needed)
    use_lockfile = true 
  }
}