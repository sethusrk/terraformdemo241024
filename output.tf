output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.security-group.security_group_id
}

/*
output "ec2_instance_id" {
  value = module.ec2instance.id
}
*/

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

