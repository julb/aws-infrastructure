variable "primary_hosted_zone_dns_name" {
    description = "The DNS name of the hosted zone."
}

variable "primary_hosted_zone_dns_comment" {
    description = "The comment for the hosted zone."
}

resource "aws_route53_zone" "primary_hosted_zone" {
  name    = var.primary_hosted_zone_dns_name
  comment = var.primary_hosted_zone_dns_comment
}

output "primary_hosted_zone_id" {
  value = aws_route53_zone.primary_hosted_zone.zone_id
}

output "primary_hosted_zone_dns_name" {
  value = aws_route53_zone.primary_hosted_zone.name
}