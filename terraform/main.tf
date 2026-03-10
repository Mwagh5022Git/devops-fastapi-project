provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  key_name = "devops-key"

  tags = {
    Name = "DevOps-FastAPI-Server"
  }
}
