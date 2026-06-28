terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
  # remote storage location for terraform state file
  backend "s3" {
    bucket = "remote-state-90sgvk"
    key    = "remote-state-demo.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # S3 will lock while running the script 
  }
}
# Configure the AWS Provider
provider "aws" {

  region = "us-east-1"

}
