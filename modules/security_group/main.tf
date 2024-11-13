resource "aws_security_group" "http_access" {
  name        = "http_access"
  description = "Security group for HTTP and SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting this to specific IPs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting this to specific IPs
  }

  ingress {
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from any IP, adjust as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"           # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}