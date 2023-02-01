# --------------------------
# CONFIGURE OUR AZURE PROVIDER
# --------------------------

provider "azurerm" {  
  features {}
}

# ---------
# MODULES
# ---------

module "mod_azure_region_lookup" {
  source  = "../.."
  
  azure_region = "eastus"
}

# ---------
# OUTPUTS
# ---------

output "location_full_name" {
  value = module.mod_azure_region_lookup.location_full_name
}

output "location_short" {
  value = module.mod_azure_region_lookup.location_short
}

output "location_cli" {
  value = module.mod_azure_region_lookup.location_cli
}