# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Generate SSH Key Pair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a key pair in AWS using the generated public key
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

# Save the private key locally
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${path.module}/tf_key_pair.pem"  # Ensure this path is accessible and used correctly
}

# VPC Module
module "vpc" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
}

# Security Group Module
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id

  depends_on = [module.vpc]
}

# EC2 Module
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name

  security_group_id = module.security_group.security_group_id

  public_subnet_id = module.vpc.public_subnet_ids[0]
  vpc_id = module.vpc.vpc_id
  key_name         = aws_key_pair.key_pair.key_name
  private_key       = local_file.tf-key.content

  depends_on = [module.vpc, module.security_group] 
}