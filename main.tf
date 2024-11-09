resource "aws_instance" "firstserver" {
ami           = data.aws_ami.amlin.id
instance_type = var.instance_type
security_groups = data.aws_security_group.terraformdemo.id

  tags = {
    Name = "HelloWorld"
  }
  
}
