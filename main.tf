module "create_namespace" {
  source  = "./namespace-create"

  vault_addr = var.vault_addr
  vault_namespace = var.vault_namespace
  vault_github_token = var.vault_github_token

  providers = {
    vault = vault.github_vault
  } 
}

module "update_namespace" {
  source  = "./namespace-update"

  vault_addr = var.vault_addr
  vault_namespace = var.vault_namespace
  vault_token = module.create_namespace.admin_token

  # depends_on = [
  #   module.create_namespace
  # ]
  providers = {
    vault = vault.namespaced_vault
  } 
}