terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_security_group" "sg_for_linux_25" {
  name        = "sg_for_linux_25"
  description = "Security group to allow SSH,HTTP,HTTPS access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  ingress {
    from_port = 80
    to_port =80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"] 
  }
  ingress {
    from_port = 443
    to_port =443
    protocol ="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_instance" "webserver" {
  ami           = "ami-0fa3fe0fa7920f68e"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_for_linux_25.id]
   tags = {
    Name = "linux-server-25"
  }
}
