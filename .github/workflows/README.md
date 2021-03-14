# Notes specific GitHub Actions




### Composite actions
Composites allow one to group a series of steps into one action. For example, a common pattern in your workflows is: step1, step2, step3 then step4. In this scenario, it possibly makes sense to put those 4 steps in a composite action. Your main workflow will now execute the composite action.
- [info](https://docs.github.com/en/actions/creating-actions/creating-a-composite-run-steps-action)

# Azure Cloud and GitHub Actions
Worth nothing that to run the github actions portion of this project, you'll need an azure account and a github account.
Also worth noting that I am using a custom Docker image for the jobs in the GitHub workflow. So you'd need the credentials to my registery. 
I'll probably parameterize that in the yaml file so you can substitute your own registry and credentials.

Couple links:
- I make use of the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) for interaction with Azure. It is included in the dev image / ci image.
- GitHub Action Workflow Syntax [documentation](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- VSCode [ARM Templates Extension](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools) is helpful for working with ARM templates

### commands that I used in this part of the series. saving them here for reference.

```
az ad sp create-for-rbac --name CIServicePrincipal --role Contributor

az login --service-principal --username <github secret> --password <github secret> --tenant <github secret>

az account set --subscription <github secret>
```
### general pipeline flow

```
az deployment group create --name addwebapp --resource-group TechExchangeDemoGroup --template-file  /path/to/infra.json --parameters storagePrefix=dubsalot storageSKU=Standard_LRS webAppName=dubsalot

dotnet publish --output cibuild

cd cibuild

az webapp up --runtime "DOTNETCORE|3.1" --os Linux --name dubsalot --debug
```

- The workflow is stored in .github/main.yml
- The jobs in the build depend on a custom container I use for dev tools. You can find that docker file under .ci/
- The jobs pull dubsalot.azurecr.io/ci/azure from an my personal Azure Container Registry

The credentials are stored in GitHub Action Secrets:
- AZ_SVC_PRINCIPAL_UN: ${{ secrets.AZ_SVC_PRINCIPAL_UN }}
- AZ_SVC_PRINCIPAL_PW: ${{ secrets.AZ_SVC_PRINCIPAL_PW }}
