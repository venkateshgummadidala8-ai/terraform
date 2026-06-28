locals {
    name = "${var.project}-${var.environment}"
    instance_type = "t2.micro"   # this will be fixed and cannot be changed from outside
    ami_id = data.aws_ami.joindevops.id
    common_tags = {
        project = "${var.project}-${var.environment}"
        Environment = var.environment
    }

    ec2_tags = merge(
        local.common_tags,
        {
            Name = "${local.name}-locals-demo"   # roboshop-dev-locals-demo
        }
    )

    sg_tags = merge(
        local.common_tags,
        {
            Name = "${local.name}-common"  # roboshop-dev-common
        }
    )
}
