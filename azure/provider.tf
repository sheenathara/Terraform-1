
# export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
# export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
# export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
# export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"

# terraform {
#   cloud {
#     organization = "example-org-390a22"
#     workspaces {
#       name = "azure"
#     }
#   }
# }

provider "azurerm" {
#  client_id       = var.client_id
#  client_secret   = var.client_secret
#  tenant_id       = var.tenant_id
#  subscription_id = var.subscription_id
   use_cli = false
   use_msi = true
   use_oidc = false
   features {}
}

#variable "client_id" {
#  type = string
#}

#variable "client_secret" {
#  type = string
#}

#variable "tenant_id" {
#  type = string
#}

#variable "subscription_id" {
#  type = string
#}
