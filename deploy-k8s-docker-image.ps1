[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $Version,

    [Parameter(Mandatory = $true)]
    [string]
    $AcrName,

    [Parameter(Mandatory = $true)]
    [string]
    $TargetNamespace
)
docker build . -f ./scenario-k8s-docker-image/Dockerfile -t $AcrName.azurecr.io/react-app:$Version
docker push $AcrName.azurecr.io/react-app:$Version

helm upgrade -i frontend-example --set image.tag=$Version ./scenario-k8s-docker-image/helm-chart -n $TargetNamespace
