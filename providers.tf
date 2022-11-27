// credentials "app.terraform.io" {
//   token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
// }

terraform {
  cloud {
    organization = "mag"

    workspaces {
      name = "vault-test"
    }
  }
  
  required_providers {
    vault = {
      version = "3.11.0"
    }
    restapi = {
      source = "fmontezuma/restapi"
    }
  }
}

provider "vault" {
  address = var.vault_addr // var.vault-url
  skip_tls_verify = true
  # skip_child_token = true

  token = var.vault_token // var.token
}