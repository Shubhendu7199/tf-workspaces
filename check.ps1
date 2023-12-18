$workspaces = Invoke-RestMethod -Uri "https://app.terraform.io/api/v2/organizations/Shubhendu/workspaces" -Headers @{
    Authorization = "Bearer XXXXXXXXXXXXXXXXXXXXXXXX"
}

foreach ($workspace in $workspaces.data) {
    $workspaceName = $workspace.attributes.name
    $workspaceId = $workspace.id

    $variables = Invoke-RestMethod -Uri "https://app.terraform.io/api/v2/workspaces/$workspaceId/vars" -Headers @{
        Authorization = "Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXX"
    }

    $azureProviderAuthVariable = $variables.data | Where-Object { $_.attributes.key -eq 'TFC_AZURE_PROVIDER_AUTH' }

    if ($azureProviderAuthVariable) {
        $azureProviderAuthValue = $azureProviderAuthVariable.attributes.value

        Write-Output "Workspace '$workspaceName' - TFC_AZURE_PROVIDER_AUTH: '$azureProviderAuthValue'"

        if ($azureProviderAuthValue -eq 'true') {

            $clientIdVariable = $variables.data | Where-Object { $_.attributes.key -eq 'TFC_AZURE_RUN_CLIENT_ID' }

            if ($clientIdVariable) {
                $clientIdValue = $clientIdVariable.attributes.value
                Write-Output "  TFC_AZURE_RUN_CLIENT_ID: '$clientIdValue'"
            }
        }
    }
}
