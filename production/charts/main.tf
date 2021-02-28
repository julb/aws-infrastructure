variable route53_hosted_zone_id {
    description = "The Zone ID in which to create the record."
}

variable route53_hosted_zone_charts_dns_name {
    description = "The DNS name to use for the charts."
}

resource "aws_route53_record" "charts_route53_record" {
  zone_id = var.route53_hosted_zone_id
  name    = var.route53_hosted_zone_charts_dns_name
  type    = "CNAME"
  ttl     = "300"
  records = [
    "julb.github.io."
  ]
}