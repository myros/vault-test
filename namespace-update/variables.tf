variable "vault_addr" {
  type        = string
  description = "Vault ADDR"
}

variable "vault_token" {
  type        = string
  description = "Vault token with permissions"
}

variable "vault_namespace" {
  type        = string
  description = "Vault user namespace"
}