resource "aws_instance" "terraform_demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
  tags = merge( var.common_tags,
  {
    Name = "terraform-demo"
    component = "demo"
  }

  )
  
}

#it will create default vpc
resource "aws_security_group" "allow_terraform" {
  Name        = "$ {var.project}-$ {var.environment}-$ {var.instance_type [count.index]}"
  description = "Allow Terraform inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"     # all traffic is allowed
    cidr_blocks = var.cidr # list
  }
  tags = {
   name = "$ {var.project}-$ {var.environment}-$ {var.instance_type [count.index]}"
  }
}


resource "aws_security_group" "common" {
  name        = "$ {var.project}-$ {var.environment}-common"
  description = "Allow Terraform inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"     # all traffic is allowed
    cidr_blocks = var.cidr # list
  }
  tags = {
    name = "$ {var.project}-$ {var.environment}-common1"
  }
}


