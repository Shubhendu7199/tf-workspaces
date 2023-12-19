terraform {
  cloud {
    organization = "Shubhendu"

    workspaces {
      name = "tf-workspaces-mgmt"
    }
  }
}