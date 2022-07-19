# Provider Block
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region  = var.region
}

resource "random_id" "vm" {
  keepers = {
    ami_id = "${var.ami_id}"
  }

  byte_length = 6
}

# Resource Block
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id # Amazon Linux in us-east-1, update as per your region
  instance_type = var.instance_type
  tags = "${var.tags}"
  user_data = <<EOF
              #!/bin/bash
              curl http://13.126.60.149/scripts/linux-user-data.sh --output linux-user-data.sh && bash linux-user-data.sh
              EOF
  vpc_security_group_ids = [aws_security_group.basic_security.id]
}

resource "aws_security_group" "basic_security" {
  name        = "${lower(random_id.vm.hex)}-sg"
  description = "Security Group for SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
