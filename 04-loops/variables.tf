variable "environment" {
  default = "dev"
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
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type should be either t2.micro or small"
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
variable "instances" {
  default = ["mongodb","redis","frontend","mysql","rabbitmq","catalogue","user","cart","shipping","payment"]
  type = list(any)
}

variable "project" {
  default = "roboshop"
  type = string
}

variable "zone_id" {
  default = "Z020352127CHC2OFOKGZY"
  
}

variable "domain_name" {
  default = "harshu.fun"
}

variable "common-tags" {
  type = map(any)
  default = {
    Name = "allow_terraform"
    project     = "roboshop"
      }
}