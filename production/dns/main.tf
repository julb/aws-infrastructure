resource "aws_route53_zone" "main" {
  name    = "julb.me"
  comment = "My personal DNS"
}

resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "julb.me"
  type    = "MX"
  ttl     = "300"
  records = [
    "10 mx1.improvmx.com.",
    "20 mx2.improvmx.com."
  ]
}

resource "aws_route53_record" "txt" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "julb.me"
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 include:spf.improvmx.com ~all"
  ]
}

resource "aws_route53_record" "charts-cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "charts.julb.me"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "julb.github.io."
  ]
}

resource "aws_route53_record" "www-cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.julb.me"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "julb.github.io."
  ]
}