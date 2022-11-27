output "admin_token" {
  value = module.create_namespace.admin_token
  sensitive = true
}