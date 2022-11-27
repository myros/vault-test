variable "vault_addr" {
  type        = string
  default     = "https://vault-111.34-83-87-204.sslip.io"
  description = "Vault ADDR"
}

variable "vault_github_token" {
  type        = string
  // default     = 
  description = "Vault token with permissions"
}

variable "vault_namespace" {
  type        = string
  // default     = 
  description = "Vault namespace"
}
