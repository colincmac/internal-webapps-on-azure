[CmdletBinding()]
param (
  [Parameter(Mandatory = $true)]
  [string]
  $StorageAccountName,

  [Parameter(Mandatory = $true)]
  [string]
  $FileShareName
)

$env:REACT_APP_ROUTE_BASE = "/";
$env:PUBLIC_URL = "/";
$env:REACT_APP_GREETING = "Hi, I'm mounted from a file share!";

npm run build --prefix ./react-app

# This just deletes the current files and replaces them. 
# The actual deployment would most likely include versioning and rolling deployments.
az storage file delete-batch --source $FileShareName --account-name $StorageAccountName --pattern *
az storage file upload-batch --destination $FileShareName --account-name $StorageAccountName --source ./react-app/build