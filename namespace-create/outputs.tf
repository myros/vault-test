# output "token" {
#   value = data.local_file.token.content
# }

output "admin_token" {
  value = data.external.get_token.result["token"]


  depends_on = [
    data.external.get_token,
    vault_namespace.user_namespace,
    vault_policy.admin_namespace_policy
  ]
}

output "namespace" {
  value = vault_namespace.user_namespace.path
}