variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
  default = "vpc-01351e56e6d87e18f"
}

variable "private_subnet_id" {
  type = string
  default = "subnet-0fbfb8b4e745f6f0d"
}

variable "cluster_name" {
  type    = string
  default = "my-eks-cluster"
}

variable "node_group_name" {
  type    = string
  default = "my-eks-nodes"
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "max_capacity" {
  type    = number
  default = 3
}

variable "min_capacity" {
  type    = number
  default = 1
}