# Azure Cloud and GitHub Actions
Worth noting that to run the github actions portion of this project, you'll need an azure account and a github account.
Also worth noting that I am using a custom Docker image for the jobs in the GitHub workflow. So you'd need the credentials to my registery. 
I'll probably parameterize that in the yaml file so you can substitute your own registry and credentials, but it's a very simple change if you want to try it in your own repo. Let me know, and I'll try to help.

You might be interested in these links if you ever use GHA:
- I make use of the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) for interaction with Azure. It is included in the dev image / ci image.
- GitHub Action Workflow Syntax [documentation](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- VSCode [ARM Templates Extension](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools) is helpful for working with ARM templates



# Work in progress
This repo does not have the purpose of being a blueprint for anything. It does not have the same burdens/responsibiities as the ALM Example App repos for example.
I'm not stating "this is definitely how you should accomplish implementing github actions"
I'm using this as a sandbox to learn. It's a work in progress.


### RBAC / "CIServicePrincipal"
My workflows need to run in a context that gives them proper permissions to Azure.

```
az ad sp create-for-rbac --name CIServicePrincipal --role Contributor

az login --service-principal --username <github secret> --password <github secret> --tenant <github secret>

az account set --subscription <github secret>
```


### Summary of this workflow

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
