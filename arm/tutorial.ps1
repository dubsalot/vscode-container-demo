#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   Azure CLI for windows, linux, mac:  https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
#   Part 1: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-cli
#   Part 2: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-resource?tabs=azure-powershell
#   Part 3: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-parameters?tabs=azure-cli
#
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# need this in the pipeline. does az login take credentials on cli ?
az login


#   lesson 1
az account set --subscription d739ae26-2404-45d1-a067-0ee9779c8d8c
az group create --name myResourceGroup --location "South Central US"
az deployment group create --name blanktemplate --resource-group myResourceGroup --template-file .\azuredeploy.json


#   lesson 2
az deployment group create --name addstorage --resource-group myResourceGroup --template-file .\azuredeploy.json

#   lesson 3
#   note: the point of the lesson is to add a variable to the template. this could be passed in from pipeline
az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageName=dusbalot02212021


#az account show --query "{subscriptionId:id, tenantId:tenantId}"
#             {
#                 "subscriptionId": "d739ae26-2404-45d1-a067-0ee9779c8d8c",
#                 "tenantId": "f63f7542-dcd8-4a64-a45e-7186913edaf9"
#             }

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

# az deployment group create --name blanktemplate --resource-group myResourceGroup --template-file .\azuredeploy.json
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



#az deployment group create --name addstorage --resource-group myResourceGroup --template-file .\azuredeploy.json
##    took about 1 minute to run.
##    running a subsequent time resulted in no error - not sure if it would apply changes and I should test that 
##    or see if there is an "update" like there is a "create"  :shrug:
##    from lesson 3: this actually updates the resource if the properties changed! really cool.
# 
#    {
#        "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/addstorage",
#        "location": null,
#        "name": "addstorage",
#        "properties": {
#          "correlationId": "b47b654f-f1e5-4327-8935-f1b940798bfb",
#          "debugSetting": null,
#          "dependencies": [],
#          "duration": "PT22.114746S",
#          "error": null,
#          "mode": "Incremental",
#          "onErrorDeployment": null,
#          "outputResources": [
#            {
#              "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/dusbalot02212021",
#              "resourceGroup": "myResourceGroup"
#            }
#          ],
#          "outputs": null,
#          "parameters": null,
#          "parametersLink": null,
#          "providers": [
#            {
#              "id": null,
#              "namespace": "Microsoft.Storage",
#              "registrationPolicy": null,
#              "registrationState": null,
#              "resourceTypes": [
#                {
#                  "aliases": null,
#                  "apiProfiles": null,
#                  "apiVersions": null,
#                  "capabilities": null,
#                  "defaultApiVersion": null,
#                  "locationMappings": null,
#                  "locations": [
#                    "southcentralus"
#                  ],
#                  "properties": null,
#                  "resourceType": "storageAccounts"
#                }
#              ]
#            }
#          ],
#          "provisioningState": "Succeeded",
#          "templateHash": "2954769913832277148",
#          "templateLink": null,
#          "timestamp": "2021-02-21T19:47:53.500745+00:00",
#          "validatedResources": null
#        },
#        "resourceGroup": "myResourceGroup",
#        "tags": null,
#        "type": "Microsoft.Resources/deployments"
#    }




#az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageName=dusbalot02212021
#       {
#           "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/addnameparameter",
#           "location": null,
#           "name": "addnameparameter",
#           "properties": {
#             "correlationId": "70678f99-cbfa-4d8c-b8f1-287bc05c9965",
#             "debugSetting": null,
#             "dependencies": [],
#             "duration": "PT2.4580198S",
#             "error": null,
#             "mode": "Incremental",
#             "onErrorDeployment": null,
#             "outputResources": [
#               {
#                 "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/dusbalot02212021",
#                 "resourceGroup": "myResourceGroup"
#               }
#             ],
#             "outputs": null,
#             "parameters": {
#               "storageName": {
#                 "type": "String",
#                 "value": "dusbalot02212021"
#               }
#             },
#             "parametersLink": null,
#             "providers": [
#               {
#                 "id": null,
#                 "namespace": "Microsoft.Storage",
#                 "registrationPolicy": null,
#                 "registrationState": null,
#                 "resourceTypes": [
#                   {
#                     "aliases": null,
#                     "apiProfiles": null,
#                     "apiVersions": null,
#                     "capabilities": null,
#                     "defaultApiVersion": null,
#                     "locationMappings": null,
#                     "locations": [
#                       "southcentralus"
#                     ],
#                     "properties": null,
#                     "resourceType": "storageAccounts"
#                   }
#                 ]
#               }
#             ],
#             "provisioningState": "Succeeded",
#             "templateHash": "13997950872320143992",
#             "templateLink": null,
#             "timestamp": "2021-02-21T20:27:22.497204+00:00",
#             "validatedResources": null
#           },
#           "resourceGroup": "myResourceGroup",
#           "tags": null,
#           "type": "Microsoft.Resources/deployments"
#       }