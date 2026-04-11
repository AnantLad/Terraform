provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "anant" {
    ami = "ami-0b6c6ebed2801a5cb"
    instance_type = "t3.micro"
    subnet_id = "subnet-0146e29f56ca7222e"
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "anant-s3-bucket-01"
}
resource "aws_dynamodb_table" "dynamodb_table_1" {
  
    name         = "anant-dynamodb-table-01"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "id"
    
    attribute {
        name = "id"
        type = "S"
    }
    }