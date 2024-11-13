output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.security-group.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2instance.id
}