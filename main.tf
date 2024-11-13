/*
resource "aws_instance" "firstserver" {
ami           = data.aws_ami.amlin.id
instance_type = var.instance_type
vpc_security_group_ids = [data.aws_security_group.terraformdemo.id]

  tags = {
    Name = "HelloWorld"
  }
  
}
*/

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"
  azs = ["ap-south-1a"]
    tags = {
    Name = "myvpc"
  }
  private_subnets = ["10.0.1.0/24"]
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"
  name = "test"
  vpc_id = module.vpc.vpc_id
}

module "ec2instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  ami           = data.aws_ami.amlin.id
  instance_type = var.instance_type
  subnet_id = "subnet-0c9fa01885341c65e"
  vpc_security_group_ids = [module.security-group.security_group_id]

    tags = {
    Name = "HelloWorld"
  }

}