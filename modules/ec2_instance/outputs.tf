output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.webserver_ec2.public_ip  # Ensure this matches the resource name
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.webserver_ec2.id  # Ensure this matches the resource name
}