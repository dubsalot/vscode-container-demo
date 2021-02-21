az login
#az account show --query "{subscriptionId:id, tenantId:tenantId}"
az account set --subscription d739ae26-2404-45d1-a067-0ee9779c8d8c

az group create --name myResourceGroup --location "South Central US"

az deployment group create --name blanktemplate --resource-group myResourceGroup --template-file .\azuredeploy.json


# az group create --name myResourceGroup --location "South Central US"
#                   {
#                       "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup",
#                       "location": "southcentralus",
#                       "managedBy": null,
#                       "name": "myResourceGroup",
#                       "properties": {
#                         "provisioningState": "Succeeded"
#                       },
#                       "tags": null,
#                       "type": "Microsoft.Resources/resourceGroups"
#                     }

az deployment group create --name blanktemplate --resource-group myResourceGroup --template-file .\azuredeploy.json
#   {
#      "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/blanktemplate",
#      "location": null,
#      "name": "blanktemplate",
#      "properties": {
#        "correlationId": "07fa3c2d-3ee4-4e11-9a0b-2633c2d0842e",
#        "debugSetting": null,
#        "dependencies": [],
#        "duration": "PT0.7975674S",
#        "error": null,
#        "mode": "Incremental",
#        "onErrorDeployment": null,
#        "outputResources": [],
#        "outputs": null,
#        "parameters": null,
#        "parametersLink": null,
#        "providers": [],
#        "provisioningState": "Succeeded",
#        "templateHash": "11481920352792298114",
#        "templateLink": null,
#        "timestamp": "2021-02-21T18:54:42.110900+00:00",
#        "validatedResources": null
#      },
#      "resourceGroup": "myResourceGroup",
#      "tags": null,
#      "type": "Microsoft.Resources/deployments"
#    }