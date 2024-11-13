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
  description = "Map of private subnet configurations"
  type        = map(number)
}

variable "public_subnets" {
  description = "Map of public subnet configurations"
  type        = map(number)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
}


