terraform {
    required_version = ">1.0.0"
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">3.0.0"
      }
    }
    backend "remote" {
      organization = "last-cloud"
      workspaces {
        name = "cli-driven"
      }
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "grp1" {
  name = local.resource-name
  location = var.rg-loc
}