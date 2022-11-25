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
  "policies": ["git-admin"],
  "bound_claims": {
    "ref_type": "branch",
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


### Issues

* bound claim - connected to repo
* git-admin policy
* should be root ns => creating new namespace => enable engines & auth => ns admin token
* github should log in to root namespace (regardless of user) and the problem is bound_claim
