# SECRET ZERO


vault auth enable jwt 

```
vault write auth/jwt/config \
                                     bound_issuer="https://token.actions.githubusercontent.com" \
                                     oidc_discovery_url="https://token.actions.githubusercontent.com"
```

```

vault write auth/jwt/role/git-onboarding -<<EOF
{
  "role_type": "jwt",
  "user_claim": "actor",
  "policies": ["github-admin"],
  "bound_claims": {
    "repository_owner": "myros"
  },
  "ttl": "10m", 
  "token_explicit_max_ttl": "10m"
}
EOF

```

```

vault write auth/jwt/role/git-onboarding -<<EOF
{
  "role_type": "jwt",
  "user_claim": "actor",
  "bound_claims": {
    "repository": "myros/vault-test"
  },
  "policies": ["git-admin"],
  "ttl": "10m", 
  "token_explicit_max_ttl": "10m"
}                                              
EOF

```


### Workflow

#### Github admin

* login to vault with github-admin token policy
* create user namespace and admin policy for the namespace
* revoke token

#### User Namespace

* execute namespace TF code

### Issues


* bound claim - connected to repo
* git-admin policy
* should be root ns => creating new namespace => enable engines & auth => ns admin token
* github should log in to root namespace (regardless of user) and the problem is bound_claim

### Links

https://developer.hashicorp.com/vault/tutorials/recommended-patterns/pattern-policy-templates


# Read system health check
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Create and manage ACL policies broadly across Vault

# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage authentication methods broadly across Vault

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

```
path "sys/namespaces" {
  capabilities = ["list"]
}

path "sys/namespaces/my-team" {
  capabilities = ["list", "read"]
}

path "sys/namespaces/my-team/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# manage auth
path "sys/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

```


```

path "+/sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "+/+/sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Manage policies
path "+/sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "+/+/sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "+/sys/policies/acl" {
  capabilities = ["list"]
}
path "+/+/sys/policies/acl" {
  capabilities = ["list"]
}
# Enable and manage secrets engines
path "+/sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "+/+/sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
# List available secrets engines
path "+/sys/mounts" {
  capabilities = ["read"]
}
path "+/+/sys/mounts" {
  capabilities = ["read"]
}

```