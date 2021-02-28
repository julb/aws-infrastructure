variable route53_hosted_zone_id {
    description = "The Zone ID in which to create the record."
}

variable route53_hosted_zone_dns_name {
    description = "The DNS name to use."
}

resource "aws_route53_record" "mail_forwarding_mx_route53_record" {
  zone_id = var.route53_hosted_zone_id
  name    = var.route53_hosted_zone_dns_name
  type    = "MX"
  ttl     = "300"
  records = [
    "10 mx1.improvmx.com.",
    "20 mx2.improvmx.com."
  ]
}

resource "aws_route53_record" "mail_forwarding_txt_route53_record" {
  zone_id = var.route53_hosted_zone_id
  name    = var.route53_hosted_zone_dns_name
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 include:spf.improvmx.com ~all"
  ]
}