# resource "aws_instance" "instance" {
#   for_each                = var.components
#
#   ami                     = var.ami
#   instance_type           = each.value["instance_type"]
#   vpc_security_group_ids  = [ aws_security_group.ex2[each.key].id ]
#
#   tags = {
#     Name    = "${each.key}-${var.env}"
#   }
# }
#
# resource "aws_route53_record" "dns_records" {
#   for_each  = var.components
#
#   zone_id   = var.zone_id
#   name      = "${each.key}-${var.env}"
#   type      = "A"
#   ttl       = 30
#   records   = [aws_instance.instance[each.key].private_ip]
# }
