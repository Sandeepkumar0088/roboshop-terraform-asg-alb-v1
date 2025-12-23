resource "null_resource" "test" {}
resource "aws_instance" "db_instance" {
  for_each                = var.db_components

  ami                     = var.ami
  instance_type           = each.value["instance_type"]
  vpc_security_group_ids  = [ aws_security_group.ex2[each.key].id ]
  user_data = templatefile("${path.module}/user_data.sh", { component = each.key, env = var.env })
  tags = {
    Name    = "${each.key}-${var.env}"
  }


}

resource "aws_route53_record" "db_dns_records" {
  for_each  = var.db_components

  zone_id   = var.zone_id
  name      = "${each.key}-${var.env}"
  type      = "A"
  ttl       = 30
  records   = [aws_instance.db_instance[each.key].private_ip]
}


