resource "vault_mount" "kvv2" {
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_token" "token" {
  # role_name = "user"

  policies = ["policy1", "policy2"]

  renewable = true
  ttl = "24h"

  renew_min_lease = 43200
  renew_increment = 86400

}