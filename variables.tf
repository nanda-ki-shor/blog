variable domain {
  default = "nandakishore.dev"
}

variable zone_id {
  default = "cc1635f8d56bf5d4ded853b5b1648a05"
}

variable cloudflare_email {
  type = string
}

variable cloudflare_token {
  type = string
  sensitive = true
}
