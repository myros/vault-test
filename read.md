https://medium.com/@ericchap/github-actions-and-vault-by-hashicorp-3ad0636fef97






name: 'Terraform'

on:
  push:
    branches: [ "main" ]
  pull_request:

permissions:
  contents: read

jobs:
  terraform:
    name: 'Terraform'
    runs-on: ubuntu-latest
    environment: production
    permissions:
      contents: read
      id-token: write
    # Use the Bash shell regardless whether the GitHub Actions runner is ubuntu-latest, macos-latest, or windows-latest
    defaults:
      run:
        shell: bash

    steps:
    - name: Set JWT Auth Token
      id: auth-token
      run: |
          export TOKEN=$(curl -sSL -H "Authorization: bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" "$ACTIONS_ID_TOKEN_REQUEST_URL")
          echo $TOKEN | jq .value | base64
          echo "token=$(echo $TOKEN)" >> $GITHUB_OUTPUT
          
    - name: Troubleshoot Token
      id: grab-token
      run: |
          export TOKEN_JSON=$(echo $GITHUB_OIDC_TOKEN | jq "{ jwt: .value, role: \"$VAULT_ROLE\" }")
          echo $TOKEN_JSON | jq -r '.jwt | split(".") | .[1] | @base64d' | jq
          export VAULT_LOGIN_DATA=$(echo $TOKEN_JSON | curl -sSLf -X PUT -H "Content-Type: application/json" --data @- $VAULT_URL/v1/auth/jwt/login)

          echo $VAULT_LOGIN_DATA
          export VAULT_TOKEN=$(echo $VAULT_LOGIN_DATA | jq -r .auth.client_token)
          echo "vault_token=$(echo $VAULT_TOKEN)" >> $GITHUB_OUTPUT
          echo $vault_token
      env:
        VAULT_ROLE: "myproject-staging"
        VAULT_URL: "https://vault.magserver.com"
        GITHUB_OIDC_TOKEN: ${{ steps.auth-token.outputs.token }}

    # Checkout the repository to the GitHub Actions runner
    - name: Checkout
      uses: actions/checkout@v3

    # Install the latest version of Terraform CLI and configure the Terraform CLI configuration file with a Terraform Cloud user API token
    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1
      with:
        cli_config_credentials_token: ${{ secrets.TF_API_TOKEN }}

    # Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
    - name: Terraform Init
      run: terraform init -input=false

    # Generates an execution plan for Terraform
    - name: Terraform Plan
      run: terraform plan -input=false
      env:
        TF_VAR_vault_token: ${{ steps.grab-token.outputs.vault_token }}
      # On push to "main", build or change infrastructure according to Terraform configuration files
      # Note: It is recommended to set up a required "strict" status check in your repository for "Terraform Cloud". See the documentation on "strict" required status checks for more information: https://help.github.com/en/github/administering-a-repository/types-of-required-status-checks
    - name: Terraform Apply
      run: terraform apply -auto-approve -input=false
      env:
        TF_VAR_vault_token: ${{ steps.grab-token.outputs.vault_token }}
