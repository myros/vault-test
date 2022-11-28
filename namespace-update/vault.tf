resource "vault_mount" "kvv2" {
  namespace = vault_namespace.user.path
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

# resource "vault_mount" "kvv3" {
#   namespace = vault_namespace.user.path
#   path        = "kvv3"
#   type        = "kv"
#   options     = { version = "2" }
#   description = "KV Version 2 secret engine mount"
# }


# resource "vault_token" "token" {
#   # role_name = "user"
#   namespace = "k5" # vault_namespace.user.path

#   # policies = [vault_policy.admin_namespace_policy.name]
#   no_default_policy = true

#   renewable = true
#   ttl = "24h"

#   renew_min_lease = 43200
#   renew_increment = 86400

# }

# data "restapi_object" "vault_token" {
#     path = "/v1/auth/tokens/create"
# }

# output "token" {
#   value = restapi_object.vault_token
# }