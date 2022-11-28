#!/bin/bash
set -ex pipefail

generate_post_data()
{
  cat <<EOF
{
    "policies": ["admin-policy"],
    "orphan": "false"
}
EOF
}

# GRAB DATA FROM TERRAFORM QUERY BLOCK

eval "$(jq -r '@sh "ADDR=\(.addr) TOKEN=\(.token) NAMESPACE=\(.namespace)"')"

# EXECUTE COMMAND 

NEW_TOKEN=$(curl --location --request POST -H X-Vault-Token:${TOKEN} --data "$(generate_post_data)" ${ADDR}/v1/auth/token/create | jq -r .auth.client_token)

# WILL BE RETURNED AS JSON RESULT

jq -n --arg new_token "$NEW_TOKEN" '{"token":$new_token}'
