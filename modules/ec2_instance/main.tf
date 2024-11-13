# Create EC2 instance
resource "aws_instance" "webserver_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name

  tags = {
    Name = var.instance_name
  }

  # SSH connection for provisioning
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_key
    host        = self.public_ip
  }

  # Provision playbook file and installation script on the instance
  provisioner "file" {
    source      = "${path.module}/../../ansible/playbook.yaml"
    destination = "/home/ubuntu/playbook.yaml"
  }

  provisioner "file" {
    source      = "${path.module}/../../ansible/install.sh"
    destination = "/home/ubuntu/install.sh"
  }

   # Additional file provisioners to copy other files (like src/ and requirements.txt)
  provisioner "file" {
    source      = "${path.module}/../../src"
    destination = "/home/ubuntu/src"
  }

  provisioner "file" {
    source      = "${path.module}/../../requirements.txt"
    destination = "/home/ubuntu/requirements.txt"
  }

  # Run the installation script on the instance
  provisioner "remote-exec" {
    inline = [
      "sudo chown -R ubuntu:ubuntu /home/ubuntu/.venv",
      "sudo chmod -R 755 /home/ubuntu/.venv",
      "chmod +x /home/ubuntu/install.sh",
      "/home/ubuntu/install.sh",
      "sudo /home/ubuntu/.venv/bin/pip install -r requirements.txt"
    ]
  }
}
