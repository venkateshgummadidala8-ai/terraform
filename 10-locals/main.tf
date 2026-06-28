resource "aws_instance" "terraform_demo" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
  tags = local.ec2_tags
}

#it will create default vpc
resource "aws_security_group" "allow_terraform" {
  name        = "${local.name}-common"
  description = "Allow Terraform inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"     # all traffic is allowed
    cidr_blocks = ["0.0.0.0/0"] # list
  }

  tags = local.sg_tags
}



