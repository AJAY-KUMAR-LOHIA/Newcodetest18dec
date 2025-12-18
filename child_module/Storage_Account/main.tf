variable "name" {}

variable "resource_group_name" {}

variable "location" {}

variable "account_tier" {}

variable "account_replication_type" {
    description = "The Replication type of the Storage Account"
    type        = string
    default     = "LRS"
}

variable "account_kind" {
    description = "The Kind of the storage account"
    type        = string
    default     = "StorageV2"
}

variable "access_tier" {
    description = "Access tier for Blob storage"
    type        = string
    default     = "Hot"
}

variable "min_tls_version" {
    description = "Minimum TLS version"
    type        = string
    default     = "TLS1_2"
}

variable "enable_https_traffic_only" {
    description = "Require HTTPS for storage account"
    type        = bool
    default     = true
}

variable "allow_blob_public_access" {
    description = "Allow public access to blob containers"
    type        = bool
    default     = false
}

variable "tags" {
    description = "Tags to apply to the storage account"
    type        = map(string)
    default     = {}
}

resource "azurerm_storage_account" "this" {
    name                     = var.name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.account_tier
    account_replication_type = var.account_replication_type
    kind                     = var.account_kind
    access_tier              = var.access_tier

    min_tls_version          = var.min_tls_version
    enable_https_traffic_only= var.enable_https_traffic_only
    allow_blob_public_access = var.allow_blob_public_access

    tags = var.tags
}

output "storage_account_id" {
    description = "ID of the storage account"
    value       = azurerm_storage_account.this.id
}

output "primary_connection_string" {
    description = "Primary connection string for the storage account"
    value       = azurerm_storage_account.this.primary_connection_string
    sensitive   = true
}

output "primary_blob_endpoint" {
    description = "Primary blob endpoint"
    value       = azurerm_storage_account.this.primary_blob_endpoint
}