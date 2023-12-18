resource "tfe_workspace" "ws" {
  name                   = var.workspace_name
  organization           = data.tfe_organization.Shubhendu.name
  project_id             = data.tfe_project.TF-Workspaces.id
  queue_all_runs         = false
  assessments_enabled    = false
  auto_apply             = false
  auto_apply_run_trigger = false
  description            = var.workspace_description
  file_triggers_enabled  = true
  trigger_patterns       = var.trigger_patterns
  working_directory      = var.working_directory
  dynamic "vcs_repo" {
    for_each = var.vcs_repo_configuration != null ? [1] : []
    content {
      identifier = "${var.vcs_repo_configuration.organization}/${var.vcs_repo_configuration.name}"
      branch     = var.vcs_repo_configuration.branch
    }
  }
}

resource "tfe_workspace_settings" "ws-settings" {
  workspace_id   = tfe_workspace.ws.id
  execution_mode = var.execution_mode
}

resource "tfe_variable" "vars" {
  for_each     = var.variables
  key          = each.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
  workspace_id = tfe_workspace.ws.id
}