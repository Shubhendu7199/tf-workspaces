data "tfe_organization" "Shubhendu" {
  name = var.organization_name
}

data "tfe_project" "TF-Workspaces" {
  name         = var.project_name
  organization = data.tfe_organization.Shubhendu.name
}