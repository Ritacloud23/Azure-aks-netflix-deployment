variable "acr_name" {
  description = "Name of the Azure Container Registry (globally unique, alphanumeric only)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to deploy ACR into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "ACR SKU tier"
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}