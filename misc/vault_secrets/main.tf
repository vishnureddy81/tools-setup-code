terraform {
  backend "s3" {
    bucket = "terraform-d81"
    key    = "vault_secrets/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "vault" {
  address = "http://vault-internal.vishnureddy.online:8200"
  token   = var.vault_token
}

variable "vault_token" {}

resource "vault_mount" "roboshop-dev" {
  path        = "roboshop-dev"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_generic_secret" "roboshop-dev" {
  path = "${vault_mount.roboshop-dev.path}/data/frontend"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}
