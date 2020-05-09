provider "cloudflare" {
  version = "~> 1.18"
  # email pulled from $CLOUDFLARE_EMAIL
  # token pulled from $CLOUDFLARE_TOKEN
}

resource "cloudflare_record" "none-da-dot-dev-A-1" {
  domain  = var.domain
  name    = "none-da.dev"
  value   = "185.199.108.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-dev-A-2" {
  domain  = var.domain
  name    = "none-da.dev"
  value   = "185.199.109.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-dev-A-3" {
  domain  = var.domain
  name    = "none-da.dev"
  value   = "185.199.110.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "none-da-dot-dev-A-4" {
  domain  = var.domain
  name    = "none-da.dev"
  value   = "185.199.111.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "www" {
  domain  = var.domain
  name    = "www"
  value   = "none-da.github.io"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_zone_settings_override" "none-da-dot-dev-settings" {
  name = var.domain

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
  zone_id = var.zone_id
  target  = format("http://%s/*", var.domain)
  actions {
    always_use_https         = true
    email_obfuscation        = "on"
    server_side_exclude      = "on"
    cache_level              = "basic"
    browser_cache_ttl        = 3599
    always_online            = "on"
    automatic_https_rewrites = "on"
  }
  status = "active"
}
