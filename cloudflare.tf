provider "cloudflare" {
  version           = "~> 1.18"
  use_org_from_zone = "none-da.com"
}

variable "domain" {
  default = "none-da.com"
}

resource "cloudflare_record" "none-da-dot-com-A-1" {
  domain  = "${var.domain}"
  name    = "none-da.com"
  value   = "185.199.108.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-com-A-2" {
  domain  = "${var.domain}"
  name    = "none-da.com"
  value   = "185.199.109.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-com-A-3" {
  domain  = "${var.domain}"
  name    = "none-da.com"
  value   = "185.199.110.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-com-A-4" {
  domain  = "${var.domain}"
  name    = "none-da.com"
  value   = "185.199.111.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "www" {
  domain  = "${var.domain}"
  name    = "www"
  value   = "none-da.github.io"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_zone_settings_override" "none-da-dot-com-settings" {
  name = "${var.domain}"

  settings {
    tls_1_3                  = "on"
    ssl                      = "full"
    always_use_https         = "on"
    min_tls_version          = "1.0"
    opportunistic_encryption = "on"
    automatic_https_rewrites = "on"
    opportunistic_onion      = "on"
  }
}

resource "cloudflare_page_rule" "page_rule" {
  zone   = "${var.domain}"
  target = "http://${var.domain}/*"
  actions {
    always_use_https         = true
    email_obfuscation        = "on"
    server_side_exclude      = "on"
    cache_level              = "basic"
    browser_cache_ttl        = 3600
    always_online            = "on"
    automatic_https_rewrites = "on"
  }
  status = "active"
}
