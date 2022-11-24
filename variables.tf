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

variable "vault-token" {
  type        = string
  // default     = 
  description = "Vault token with permissions"
}
