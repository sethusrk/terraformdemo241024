resource "aws_instance" "firstserver" {
ami           = data.aws_ami.amlin.id
instance_type = var.instance_type
vpc_security_group_ids = [data.aws_security_group.terraformdemo.id]

  tags = {
    Name = "HelloWorld"
  }
  
}
