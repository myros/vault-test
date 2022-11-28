
resource "vault_mount" "kvv2" {
  # provider  = vault.namespaced_vault
  namespace = var.vault_namespace
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_mount" "kvv3" {
  # provider  = vault.namespaced_vault
  namespace = var.vault_namespace
  path        = "kvv3"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_mount" "kvv4" {
  # provider  = vault.namespaced_vault
  namespace = var.vault_namespace
  path        = "kvv4"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}
