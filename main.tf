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
  azs = ["ap-south-1a","ap-south-1b"]
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

/*
module "ec2instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  ami           = data.aws_ami.amlin.id
  instance_type = var.instance_type
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [module.security-group.security_group_id]

    tags = {
    Name = "HelloWorld"
  }

}
*/

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.29.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [var.private_subnet_id]

  eks_managed_node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = var.node_instance_type
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
