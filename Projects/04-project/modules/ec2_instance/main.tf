provider "aws" {
    region = "us-east-1"
}
variable "ami" {
    description = "The AMI ID to use for the EC2 instance"
}
variable "instance_type" {
    description = "The type of instance to use"
}

resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
}