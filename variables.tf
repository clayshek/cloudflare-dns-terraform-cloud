variable "zone_id" {
  type          = string
  description   = "The zone ID obtained from Cloudflare"
}

variable "cloudflare_domain_suffix" {
  type          = string
}

variable "cloudflare_api_token" {
  type          = string
  description   = "Cloudflare API token"
  sensitive     = true
}

variable "a_records" {
  type = map(object({
    name        = string
    value       = string
  }))
  description   = "A map of objects representing DNS A records"
}
