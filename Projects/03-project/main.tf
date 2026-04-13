provider "aws" {
    region = "us-east-1"
}
variable "cidr" {
    default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
    key_name   = "terraform_anant"
    public_key = "/c/Users/hp/.ssh/id_rsa.pub"
}

resource "aws_vpc" "demo-terraform" {
    cidr_block = var.cidr
}

resource "aws_subnet" "demo-subnet-1" {
    vpc_id     = aws_vpc.demo-terraform.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.demo-terraform.id
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.demo-terraform.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rta1" {
    subnet_id      = aws_subnet.demo-subnet-1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = aws_vpc.demo-terraform.id

    ingress {
        description = "Allow SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTPS"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_ssh"
    }
}

resource "aws_instance" "server" {
    ami           = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.demo-subnet-1.id
    security_groups = [aws_security_group.sg.name]
    key_name      = aws_key_pair.example.key_name

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("/c/Users/hp/.ssh/id_rsa")
        host = self.public_ip
    }

    provisioner "file" {
      source = "app.py"
      destination = "/home/ubuntu/app.py"
    }

    provisioner "remote-exec" {
        inline = [
            "echo Hello from the remote server!",
            "sudo apt update -y",
            "sudo apt install python3-pip -y",
            "cd /home/ubuntu",
            "pip3 install flask",
            "nohup python3 /home/ubuntu/app.py &"
        ]
    }       
}

