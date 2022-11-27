module "create_namespace" {
  source  = "./namespace-create"

  vault_addr = var.vault_addr
  vault_namespace = var.vault_namespace
  vault_github_token = var.vault_github_token
}

module "run_namespace" {
  source  = "./namespace-update"

  vault_addr = var.vault_addr
  vault_namespace = var.vault_namespace
  namespace_token = module.create_namespace.admin_token
}