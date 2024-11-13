variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = string
}

variable "public_subnet_id" {
  description = "Public Subnet ID where the instance will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the instance will be created"
  type        = string
}

# Define the key name for SSH access
variable "key_name" {
  description = "Name for the AWS key pair"
  type        = string
}

variable "private_key" {
  description = "The private key file to be used for SSH"
  type        = string
}