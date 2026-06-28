resource "aws_instance" "terraform_demo" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_terraform.id ] # list
    tags = {
      Name = "terraform demo-2"
      project = "roboshop"
      Environment = "dev"
    }
}

#it will create default vpc
resource "aws_security_group" "allow_terraform" {
  name        = "allow_terraform"
  description = "Allow Terraform inbound traffic and all outbound traffic"

 # ingress block
 # this give us special variable ingress 
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port        = ingress.value.port
    to_port          = ingress.value.port
    protocol         = "tcp" # all traffic
    cidr_blocks      = ingress.value.cidr_blocks
            }
  }
  tags = {
    Name = "allow_terraform"
    project = "roboshop"
    Environment = "dev"
  }
}
  