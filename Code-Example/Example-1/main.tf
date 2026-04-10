provider "aws" {
    region = "us-east-1"
    }
resource "aws_instance" "example" {
    ami           = "ami-0c94855ba95c71c99" 
    instance_type = "t3.micro"
    key_name = "aws-login"
    subnet_id = "subnet-0bb1c79de3EXAMPLE"      
}