output "token" {
  value = data.local_file.token.content
}

output "admin_token" {
  value = data.external.get_token.result["token"]
}

output "namespace" {
  value = vault_namespace.user_namespace.path
}