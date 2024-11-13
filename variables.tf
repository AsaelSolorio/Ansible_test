variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "Map of private subnet configurations (key: name, value: index)"
  type        = map(number)
}

variable "public_subnets" {
  description = "Map of public subnet configurations (key: name, value: index)"
  type        = map(number)
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
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

variable "key_name" {
  description = "key name"
  type = string
  
}