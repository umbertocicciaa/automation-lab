resource "aws_instance" "my_instance" {
  ami           = "ami-0b6d6dacf350ebc82"
  instance_type = var.instance_type
  tags = {
    Name = "MyInstance"
  }
}
