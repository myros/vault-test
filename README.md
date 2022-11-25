# vault-test


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

* login to vault with github-admin token policy
* create user namespace 


### Issues


* bound claim - connected to repo
* git-admin policy
* should be root ns => creating new namespace => enable engines & auth => ns admin token
* github should log in to root namespace (regardless of user) and the problem is bound_claim

### Links

https://developer.hashicorp.com/vault/tutorials/recommended-patterns/pattern-policy-templates

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
```
