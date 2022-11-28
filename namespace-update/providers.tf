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
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    # restapi = {
    #   source               = "Mastercard/restapi"
    #   version              = "1.18.0"
    # }
  }
}

provider "vault" {
  address = var.vault_addr // var.vault-url
  skip_tls_verify = true
  # namespace = "k5"
  skip_child_token = true

  token = var.vault_token // var.token
}

provider "restapi" {
  # alias                = "restapi_headers"
    alias = "post"
    uri                  = "${var.vault_addr}"
    debug                = true
    write_returns_object = false
    create_returns_object = false

    headers = {
        "X-Vault-Token" = var.vault_token
        "Content-Type" = "application/json"
        # "X-Vault-Namespace" = "k4"
    }
  }

# data "external" "role-id" {
#   program = ["curl", "-H 'asdf'", "${var.vault_addr}/v1/tokens/create | jq >> response.json"]

#   query = {
#     # arbitrary map from strings to strings, passed
#     # to the external program as the data query.
#     id = "abc123"
#   }
# }
