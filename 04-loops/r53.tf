resource "aws_route53_record" "roboshop" {
    #count = 10
    count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}-${var.environment}.${var.domain_name}" # mongodb-dev.harshu.fun
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}
#frontend
resource "aws_route53_record" "frontend" {
  count = contains(var.instances,"frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.${var.domain_name}" # roboshop-dev.harshu.fun
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop [index(var.instances, "frontend")] .public_ip] # it gives the public ip of frontned
}