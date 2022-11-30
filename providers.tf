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
}

provider "vault" {
  alias = "github_vault"

  address = var.vault_addr
  token = var.vault_github_token

  skip_tls_verify = true
  skip_child_token = true
}

provider "vault" {
  alias = "namespaced_vault"
  address = var.vault_addr // var.vault-url
  skip_tls_verify = true
  
  skip_child_token = true

  token = module.create_namespace.admin_token
}