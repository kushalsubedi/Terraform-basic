resource "aws_route53_record" "this" {
  for_each = var.records_map

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  records = [each.value.value]
}
