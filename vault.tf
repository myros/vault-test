resource "vault_namespace" "user" {
  path = "user"
}

resource "vault_mount" "kvv2" {
  namespace = vault_namespace.user.path
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_mount" "kvv3" {
  namespace = vault_namespace.user.path
  path        = "kvv3"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_policy" "admin_namespace_policy" {
  namespace = vault_namespace.user.path
  name   = "administrators"
  policy = file("policies/admin-ns-policy.hcl")
}

resource "vault_token" "token" {
  # role_name = "user"
  namespace = vault_namespace.user.path

  policies = ["policy1", "policy2", vault_policy.admin_namespace_policy.name]
  no_default_policy = true

  renewable = true
  ttl = "24h"

  renew_min_lease = 43200
  renew_increment = 86400

}