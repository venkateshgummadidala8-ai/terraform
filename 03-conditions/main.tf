resource "aws_instance" "terraform_demo" {
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t2.micro" : "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
  tags                   = var.ec2_tags
}

#it will create default vpc
resource "aws_security_group" "allow_terraform" {
  name        = var.sg_name
  description = "Allow Terraform inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"     # all traffic is allowed
    cidr_blocks = var.cidr # list
  }

  tags = var.sg_tags
}



