terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.51.0"
    }
  }
}

provider "tfe" {
  # Configuration options
}