terraform {
  backend "s3" {
    bucket = "anant-s3-bucket-01"
    region = "us-east-1"
    key = "anant/terraform.tfstate"
  }
} 