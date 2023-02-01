output "location_full_name" {
  value       = local.regions[local.location_slug]
  description = "Azure region in standard format. Example: 'West US 2'"
}

output "location_short" {
  value       = local.short_names[local.location_slug]
  description = "Azure region in short format for resource naming purpose. Example: 'wu2'"
}

output "location_cli" {
  value       = local.cli_names[local.location_slug]
  description = "Azure region in Azure CLI name format. Example: 'westus2'"
}

output "paired_location" {
  description = <<EOD
Azure paired region with the current one. All formats available as attributes.
```
object({
  location_full_name (string): Azure paired region in standard format
  location_short (string): Azure paired region in short format for resource naming purpose
  location_cli (string): Azure paired region in CLI name format
  location_slug (string): Azure paired region in slug format
})
```
EOD
  value = local.paired_region == null ? null : {
    location_full_name = try(local.regions[local.paired_region], null)
    location_short     = try(local.short_names[local.paired_region], null)
    location_cli       = try(local.cli_names[local.paired_region], null)
    location_slug      = local.paired_region
  }
}
