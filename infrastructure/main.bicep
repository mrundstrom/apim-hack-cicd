
// az deployment group create -g rg-[YOUR POSTFIX] -f infrastructure/main.bicep -p name=[YOUR POSTFIX] sqlpwd=[A SECRET] 
// az deployment group create -g rg-lab-marrun -f infrastructure/main.bicep -p name=marrun sqlpwd=b3r3B31@HbOj

param name string
@secure()
param sqlpwd string
param location string = resourceGroup().location

module services 'services.bicep' = {
  name: 'servicesDeploy'
  params: {
    name: name
    sqlpwd:sqlpwd
    location: location
  }
}

