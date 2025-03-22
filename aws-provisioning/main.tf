terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0b6d6dacf350ebc82"
  instance_type = "t2.micro"
  tags = {
    Name = "MyInstance"
  }
}
