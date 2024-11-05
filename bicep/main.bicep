targetScope = 'subscription'

param location string = 'westeurope'
param resourceGroupName string = 'myAppResourceGroup'
param appPrefix string = 'myApp'
param appServicePlanName string = 'myAppServicePlan'

var appName = '${appPrefix}${uniqueString(rg.id)}'

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

module app './modules/app.bicep' = {
  name: 'app'
  scope: rg
  params: {
    location: location
    appName: appName
    appServicePlanName: appServicePlanName
  }
}
