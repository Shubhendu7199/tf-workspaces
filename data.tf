data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = "Shubhendu"
}

data "tfe_variables" "all_workspaces" {
  for_each     = toset(local.workspace_names)
  workspace_id = data.tfe_workspace_ids.all.ids[each.key]
}