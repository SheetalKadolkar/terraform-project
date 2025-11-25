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

resource "aws_instance" "webserver" {
  ami           = "ami-0fa3fe0fa7920f68e"
  instance_type = "t3.micro"
  count         = 1

  tags = {
    Name = "linux"
  }
}
