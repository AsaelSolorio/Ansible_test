# Outputs from the VPC module
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "nat_gateway_eip" {
  value = module.vpc.nat_gateway_eip
}

# Outputs from the Security Group module
output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.security_group.security_group_id
}

# Outputs from the EC2 Instance module
output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2_instance.instance_public_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}
