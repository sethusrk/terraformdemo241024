resource "aws_instance" "firstserver" {
      ami           = var.image_id
  instance_type = var.instance_type
count = var.server_count

  tags = {
    Name = "HelloWorld"
  }
  
}
