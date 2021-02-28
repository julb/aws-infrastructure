include {
  path = find_in_parent_folders()
}

dependency "primary-dns" {
  config_path = "../primary-dns"
}

inputs = {
  route53_hosted_zone_id = dependency.primary-dns.outputs.primary_hosted_zone_id
  route53_hosted_zone_charts_dns_name = "charts.${dependency.primary-dns.outputs.primary_hosted_zone_dns_name}"
}