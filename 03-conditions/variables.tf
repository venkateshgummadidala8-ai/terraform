variable "environment" {
  default = "prod"
  type = string
}

variable "ami_id" {
  type        = string
  description = "RHEL9 joindevops image"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium", "t2.large"], var.instance_type)
    error_message = "Instance type should be either t2.micro or small"
  }

}

variable "ec2_tags" {
  type = map(any) 
  default = {
    Name        = "terraform-demo-1"
    project     = "roboshop"
    Environment = "dev"
  }

}

variable "sg_name" {
  default = "allow_terraform_vars"
  type    = string
}

variable "port" {
  default = 0
  type    = number

}

variable "cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  type = map(string)
  default = {
    Name        = "allow_terraform"
    project     = "roboshop"
    Environment = "dev"
  }

}