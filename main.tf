terraform { 
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.7"
    }
  } 
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "a_records" {
  for_each = var.a_records

  zone_id     = "${var.zone_id}"
  name        = format("%s.%s", each.value["name"], var.cloudflare_domain_suffix)
  value       = each.value["value"]
  type        = "A"
  proxied     = false
}
