# Manage namespaces
path "sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "+/sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Manage policies
path "sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "+/sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# List policies
path "sys/policies/acl" {
   capabilities = ["list"]
}
path "+/sys/policies/acl" {
   capabilities = ["list"]
}
# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
path "+/sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
# List available secrets engines
path "sys/mounts" {
  capabilities = [ "read" ]
}
path "+/sys/mounts" {
  capabilities = [ "read" ]
}



path "sys/namespaces/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies
path "sys/policies/acl/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
   capabilities = ["list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# List available secrets engines
path "sys/mounts" {
  capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage tokens
path "auth/token/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
