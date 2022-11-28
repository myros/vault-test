
# namespaces
path "sys/namespaces" {
  capabilities = ["list"]
}

path "sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# ======================
# policies
# ======================

# Manage policies
path "+/sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "+/sys/policies/acl" {
  capabilities = ["list"]
}
