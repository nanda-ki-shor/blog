variable domain {
  default = "nandakishore.dev"
}

variable zone_id {
  default = "5ccb011513c17fe12e384df6b1a56ca5"
}

variable cloudflare_email {
  type = string
}

variable cloudflare_token {
  type = string
  sensitive = true
}
