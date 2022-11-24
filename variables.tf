variable "vault-addr" {
  type        = string
  // default     = 
  description = "Vault ADDR"
}

variable "vault-namespace" {
  type        = string
  default     = "root"
  description = "Vault Namespace"
}

variable "vault_token" {
  type        = string
  // default     = 
  description = "Vault token with permissions"
}

variable "vault_token" {
  type        = string
  default     = "none"
  description = "Vault token with permissions"
}
