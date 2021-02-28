variable route53_hosted_zone_id {
    description = "The Zone ID in which to create the record."
}

variable route53_hosted_zone_corporate_website_dns_name {
    description = "The DNS name to use for the corporate website."
}

resource "aws_route53_record" "corporate_website_route53_record" {
  zone_id = var.route53_hosted_zone_id
  name    = var.route53_hosted_zone_corporate_website_dns_name
  type    = "CNAME"
  ttl     = "300"
  records = [
    "julb.github.io."
  ]
}