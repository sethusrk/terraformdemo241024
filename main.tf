resource "aws_instance" "firstserver" {
      ami           = "ami-04a37924ffe27da53"
  instance_type = "t2.micro"
count = 3

  tags = {
    Name = "HelloWorld"
  }
  
}
