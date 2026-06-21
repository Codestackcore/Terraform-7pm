# ==========================================
# Example 1: AWS Provider & S3 Bucket Setup
# ==========================================

variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "us-east-1"

  validation {
    condition     = var.aws_region == "us-east-1" || var.aws_region == "eu-west-1"
    error_message = "The variable 'aws_region' must be one of the following regions: us-east-1, eu-west-1."
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "dev" {
  bucket = "statefile-configuresss"
  region = var.aws_region
}


# ==========================================
# Example 2: Conditional S3 Bucket Creation
# ==========================================

# variable "create_bucket" {
#   type    = bool
#   default = false
# }

# resource "aws_s3_bucket" "example" {
#   count  = var.create_bucket ? 1 : 0
#   bucket = "my-terraform-example"
# }


# ==========================================
# Example 3: Conditional EC2 Deployment Count
# ==========================================

variable "environment" {
  type    = bool
  default = true
}

resource "aws_instance" "example" {
  count         = var.environment == "prod" ? 3 : 1
  ami           = "ami-123456"
  instance_type = "t2.micro"

  tags = {
    Name = "example-${count.index}"
  }
}

# #In this case:
# #If var.envirnoment == "prod" 