variable "vault_addr" {
  type        = string
  // default     = 
  description = "Vault ADDR"
}

variable "vault_token" {
  type        = string
  // default     = 
  description = "Vault token with permissions"
}

variable "vault_namespace" {
  type        = string
  default     = "user"
  description = "Vault user namespace"
}
