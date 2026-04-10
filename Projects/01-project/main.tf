provider "aws" {
    region = "us-east-1"    
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0c94855ba95c71c99"
    instance_type_value = "t2.micro"
    subnet_id_value = "subnet-0bb1c79de3EXAMPLE"
  
}