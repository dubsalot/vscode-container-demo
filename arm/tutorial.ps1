#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   Azure CLI for windows, linux, mac:  https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
#   Part 1: empty resource group   https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-cli
#   Part 2: storage resource       https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-resource?tabs=azure-powershell
#   Part 3: template variables     https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-parameters?tabs=azure-cli
#   Part 4: template functions     https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-functions?tabs=azure-powershell
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

#   lesson 3.A
#   note: the point of the lesson is to add a variable to the template. this could be passed in from pipeline
az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageName=dusbalot02212021

#   lesson 3.B
#   note: the point of the lesson is to add a variable to the template for SKU - so we can adjust per environment. this could be passed in from pipeline
#   this time, let's pass a different sku from one of the allowed values
az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageSKU=Standard_GRS storageName=dusbalot02212021


#   lesson 4 - use resourceGroup().location to get the location of the resource group to use for the location of the storage account
#   note: the only real change here is to the azuredeploy.json file itself.
az deployment group create --name addlocationparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageName=dusbalot02212021




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



#   Lesson 3.B - notice what happened when I accidentally changed the region to eastus but left the name the same!!
#   We got the error below. This means that storage in eastUS must have names different than storage in another region! important note.
#
#   az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageSKU=Standard_GRS storageName=dusbalot02212021
#   {"error":{"code":"InvalidResourceLocation","message":"The resource 'dusbalot02212021' already exists in location 'southcentralus' in resource group 'myResourceGroup'. A resource with the same name cannot be created in location 'eastus'. Please select a new 
#   resource name."}}
#   az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageSKU=Standard_GRS storageName=dusbalot02212021
#   
#   {
#     "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/addnameparameter",
#     "location": null,
#     "name": "addnameparameter",
#     "properties": {
#       "correlationId": "ea1efed7-174f-4210-92f3-d4a934e391bc",
#       "debugSetting": null,
#       "dependencies": [],
#       "duration": "PT3.0535553S",
#       "error": null,
#       "mode": "Incremental",
#       "onErrorDeployment": null,
#       "outputResources": [
#         {
#           "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/dusbalot02212021",
#           "resourceGroup": "myResourceGroup"
#         }
#       ],
#       "outputs": null,
#       "parameters": {
#         "storageName": {
#           "type": "String",
#           "value": "dusbalot02212021"
#         },
#         "storageSKU": {
#           "type": "String",
#           "value": "Standard_GRS"
#         }
#       },
#       "parametersLink": null,
#       "providers": [
#         {
#           "id": null,
#           "namespace": "Microsoft.Storage",
#           "registrationPolicy": null,
#           "registrationState": null,
#           "resourceTypes": [
#             {
#               "aliases": null,
#               "apiProfiles": null,
#               "apiVersions": null,
#               "capabilities": null,
#               "defaultApiVersion": null,
#               "locationMappings": null,
#               "locations": [
#                 "southcentralus"
#               ],
#               "properties": null,
#               "resourceType": "storageAccounts"
#             }
#           ]
#         }
#       ],
#       "provisioningState": "Succeeded",
#       "templateHash": "4209940267245455050",
#       "templateLink": null,
#       "timestamp": "2021-02-21T20:37:02.448424+00:00",
#       "validatedResources": null
#     },
#     "resourceGroup": "myResourceGroup",
#     "tags": null,
#     "type": "Microsoft.Resources/deployments"
#   }



# Lesson 3.C - gave new name for deployment annd also changed sku - I'm probablly gonna get hammered on the bill :D
#az deployment group create --name deploymentForSkuChange --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageSKU=Standard_RAGRS storageName=dusbalot02212021
#    
#    {
#      "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/deploymentForSkuChange",
#      "location": null,
#      "name": "deploymentForSkuChange",
#      "properties": {
#        "correlationId": "e851d4e9-2d8a-46cc-8e88-25b481ba4877",
#        "debugSetting": null,
#        "dependencies": [],
#        "duration": "PT2.7714918S",
#        "error": null,
#        "mode": "Incremental",
#        "onErrorDeployment": null,
#        "outputResources": [
#          {
#            "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/dusbalot02212021",
#            "resourceGroup": "myResourceGroup"
#          }
#        ],
#        "outputs": null,
#        "parameters": {
#          "storageName": {
#            "type": "String",
#            "value": "dusbalot02212021"
#          },
#          "storageSKU": {
#            "type": "String",
#            "value": "Standard_RAGRS"
#          }
#        },
#        "parametersLink": null,
#        "providers": [
#          {
#            "id": null,
#            "namespace": "Microsoft.Storage",
#            "registrationPolicy": null,
#            "registrationState": null,
#            "resourceTypes": [
#              {
#                "aliases": null,
#                "apiProfiles": null,
#                "apiVersions": null,
#                "capabilities": null,
#                "defaultApiVersion": null,
#                "locationMappings": null,
#                "locations": [
#                  "southcentralus"
#                ],
#                "properties": null,
#                "resourceType": "storageAccounts"
#              }
#            ]
#          }
#        ],
#        "provisioningState": "Succeeded",
#        "templateHash": "4209940267245455050",
#        "templateLink": null,
#        "timestamp": "2021-02-21T20:43:55.967217+00:00",
#        "validatedResources": null
#      },
#      "resourceGroup": "myResourceGroup",
#      "tags": null,
#      "type": "Microsoft.Resources/deployments"
#    }


#   lesson 4 - use resourceGroup().location to get the location of the resource group to use for the location of the storage account
#   az deployment group create --name addlocationparameter --resource-group myResourceGroup --template-file .\azuredeploy.json --parameters storageName=dusbalot02212021

#           {
#               "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Resources/deployments/addlocationparameter",
#               "location": null,
#               "name": "addlocationparameter",
#               "properties": {
#                 "correlationId": "7a654870-d278-4af8-a86c-f560f2037bfb",
#                 "debugSetting": null,
#                 "dependencies": [],
#                 "duration": "PT1.7908158S",
#                 "error": null,
#                 "mode": "Incremental",
#                 "onErrorDeployment": null,
#                 "outputResources": [
#                   {
#                     "id": "/subscriptions/d739ae26-2404-45d1-a067-0ee9779c8d8c/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/dusbalot02212021",
#                     "resourceGroup": "myResourceGroup"
#                   }
#                 ],
#                 "outputs": null,
#                 "parameters": {
#                   "location": {
#                     "type": "String",
#                     "value": "southcentralus"
#                   },
#                   "storageName": {
#                     "type": "String",
#                     "value": "dusbalot02212021"
#                   },
#                   "storageSKU": {
#                     "type": "String",
#                     "value": "Standard_LRS"
#                   }
#                 },
#                 "parametersLink": null,
#                 "providers": [
#                   {
#                     "id": null,
#                     "namespace": "Microsoft.Storage",
#                     "registrationPolicy": null,
#                     "registrationState": null,
#                     "resourceTypes": [
#                       {
#                         "aliases": null,
#                         "apiProfiles": null,
#                         "apiVersions": null,
#                         "capabilities": null,
#                         "defaultApiVersion": null,
#                         "locationMappings": null,
#                         "locations": [
#                           "southcentralus"
#                         ],
#                         "properties": null,
#                         "resourceType": "storageAccounts"
#                       }
#                     ]
#                   }
#                 ],
#                 "provisioningState": "Succeeded",
#                 "templateHash": "15699290035728910523",
#                 "templateLink": null,
#                 "timestamp": "2021-02-21T21:37:07.900149+00:00",
#                 "validatedResources": null
#               },
#               "resourceGroup": "myResourceGroup",
#               "tags": null,
#               "type": "Microsoft.Resources/deployments"
#           }