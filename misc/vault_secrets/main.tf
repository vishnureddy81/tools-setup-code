# terraform {
#   backend "s3" {
#     bucket = "terraform-d81"
#     key    = "vault_secrets/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
#
# provider "vault" {
#   address = "http://vault-internal.vishnureddy.online:8200"
#   #vault private ip address we have to provide it.
#   token   = var.vault_token
#   skip_tls_verify = true
# }
#
# variable "vault_token" {}
#
# resource "vault_mount" "roboshop-dev" {
#   path        = "roboshop-dev"
#   type        = "kv"
#   options     = { version = "2" }
#   description = "KV Version 2 secret engine mount"
# }
#
#
#
# resource "vault_generic_secret" "roboshop-dev" {
#   path      = "${vault_mount.roboshop-dev.path}/fronted"
#
#   data_json = <<EOT
# {
# "foo": "bar"
# "pizza": "cheese"
#
# }
# EOT
#
# }


######
terraform {
  backend "s3" {
    bucket = "terraform-d81"
    key    = "vault_secrets/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "vault" {
  address         = "http://vault-internal.vishnureddy.online:8200"
  # Vault private IP or DNS we have to provide
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

# Create a new KV v2 secret engine
resource "vault_mount" "roboshop_dev" {
  path        = "roboshop-dev"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

# Create a secret under roboshop-dev/frontend
resource "vault_generic_secret" "roboshop_dev_frontend" {
  path = "${vault_mount.roboshop_dev.path}/frontend"

  data_json = <<EOT
{
  "foo": "bar",
  "pizza": "cheese"
}
EOT
}
