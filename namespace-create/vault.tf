
resource "vault_namespace" "user_namespace" {
  path = var.vault_namespace
}

resource "vault_policy" "admin_namespace_policy" {
  namespace = vault_namespace.user_namespace.path
  name   = "admin-policy"
  policy = file("${path.module}/policies/admin-ns-policy.hcl")
}

# resource "vault_token" "token" {
#   # role_name = "user"
#   # namespace = "k5" # vault_namespace.user.path

#   # policies = [vault_policy.admin_namespace_policy.name]
#   no_default_policy = true

#   renewable = true
#   ttl = "24h"

#   renew_min_lease = 43200
#   renew_increment = 86400

# }

data "external" "get_token" {
  program = ["bash", "${path.module}/get-token.sh"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    addr = var.vault_addr
    token = var.vault_github_token
    namespace = var.vault_namespace
  }
}

# data "local_file" "token" {
#   filename = "${path.module}/response.json"

#   depends_on = [
#     null_resource.get-token
#   ]
# }

# resource "null_resource" "get-token" {
#   triggers = {
#       always_run = "${timestamp()}"
#   }
#   provisioner "local-exec" {
#       command = "curl --location --request POST ${var.vault_addr}/v1/auth/token/create -H 'X-Vault-Token:${var.vault_github_token}' | jq -r .auth.client_token >response.json" 
#   }
# }

# resource "restapi_object" "vault_token" {
#   provider = restapi.post

#   path = "/v1/auth/token/create"
#   create_path = "/v1/auth/token/create"

#   data = "{}"


#   # id_attribute = "1"
#   # object_id    = "1"

#   debug = true
# }

# output "token" {
#   value = restapi_object.vault_token
# }