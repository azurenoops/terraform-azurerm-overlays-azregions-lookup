# --------------------------
# CONFIGURE OUR AZURE PROVIDER
# --------------------------

provider "azurerm" {  
  features {}
}

# ---------
# VARIABLES
# ---------
variable "location" {
  description = "Azure region in which instance will be hosted"
  type        = string
  default     = "eastus"
}

# ---------------
# CREATE THE RG
# ---------------
module "mod_azure_region_lookup" {
  source = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0"

  azure_region = var.location
}

# ---------
# OUTPUTS
# ---------

output "location_full_name" {
  value = module.mod_azure_region_lookup.location_full_name
  description = "Azure region in standard format. Example: 'West US 2'"
}

output "location_short" {
  value = module.mod_azure_region_lookup.location_short
  description = "Azure region in short format for resource naming purpose. Example: 'wus2'"
}

output "location_cli" {
  value = module.mod_azure_region_lookup.location_cli
  description = "Azure region in Azure CLI name format. Example: 'westus2'"
}
