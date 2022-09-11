terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.14"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}

resource "cloudflare_record" "nandakishore-dot-dev-A-1" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "185.199.108.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-A-2" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "185.199.109.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-A-3" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "185.199.110.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-A-4" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "185.199.111.153"
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-AAAA-1" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "2606:50c0:8000::153"
  type    = "AAAA"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-AAAA-2" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "2606:50c0:8001::153"
  type    = "AAAA"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-AAAA-3" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "2606:50c0:8002::153"
  type    = "AAAA"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-AAAA-4" {
  zone_id = var.zone_id
  name    = "nandakishore.dev"
  value   = "2606:50c0:8003::153"
  type    = "AAAA"
  proxied = true
}
resource "cloudflare_record" "nandakishore-dot-dev-TXT" {
  zone_id = var.zone_id
  name    = "_github-pages-challenge-none-da.nandakishore.dev"
  value   = "3000a8b7165779f7b3f98af89fb91b"
  type    = "TXT"
  proxied = true
}
resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  value   = "none-da.github.io"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_zone_settings_override" "nandakishore-dot-dev-settings" {
  zone_id = var.zone_id

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
    browser_cache_ttl        = 3600
    always_online            = "on"
    automatic_https_rewrites = "on"
  }
  status = "active"
}
