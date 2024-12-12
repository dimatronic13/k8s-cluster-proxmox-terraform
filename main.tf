terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.68.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_prod_url

  # TODO: use terraform variable or remove the line, and use PROXMOX_VE_USERNAME environment variable
  # TODO: use terraform variable or remove the line, and use PROXMOX_VE_PASSWORD environment variable
  api_token = "${var.proxmox_prod_tokenID}=${var.proxmox_prod_secret_token}"

  # because self-signed TLS certificate is in use
  insecure = true
  # uncomment (unless on Windows...)
  # tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    username = var.proxmox_prod_user
  }
}