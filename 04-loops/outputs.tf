output "ec2_instance_output" {
  value = aws_instance.roboshop  # this will take output from (resource "aws_instance" "roboshop" )
}