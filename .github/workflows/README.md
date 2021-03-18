# Azure Cloud and GitHub Actions
The topic of this presentation is GitHub Actions. The goal is to show some of the basic functionality. In order to accomplish, I'm deplopying the application and its current "infrastructure" to Azure

Just make note that if you would like to fork this repo, you're going to need some Azure compute and some credentials.
Also worth noting that I am using a custom Docker image for the jobs in the GitHub workflow. So you'd need the credentials to my registery. 
I'll probably parameterize that in the yaml file so you can substitute your own registry and credentials, but it's a very simple change if you want to try it in your own repo. 
You might be interested in these links if you ever use GHA:
- I make use of the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) for interaction with Azure. It is included in the dev image / CI image.
- GitHub Action Workflow Syntax [documentation](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- VSCode [ARM Templates Extension](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools) is helpful for working with ARM templates

### Similar Repo + Presentations
Near the end of putting this together, I have stumbled onto a repositorty + presentations by [Aaron Powell](https://github.com/aaronpowell) at GitHub.
* [repositories](https://github.com/AaronPowellDemos)
* [intro video](https://youtu.be/0tMkRSdp-Go)
You might find his stuff helpful, so check him out.


# This is sandbox
I'm using this as a sandbox to learn. It's a work in progress. I welcome any suggestions. Especially if you're bring offering to participate as well.

👎 ~~"this is definitely how you should implement github actions"~~

👍 "this is my current understanding of 'hello world' in GitHub actions"



### Azure Credentials "ServicePrincipal"
My workflows need to run in a context that gives them proper permissions to my Azure tenant. The output of these commands displays the credentials. You'll need to store those securely so that your workflow cann use them. I chose GitHub [Secrets for this repo](https://github.com/dubsalot/vscode-container-demo/settings/secrets/actions), but one could use Hashicorp Vault here.

You can find them referenced in the workflow like:
```
- AZ_SVC_PRINCIPAL_UN: ${{ secrets.AZ_SVC_PRINCIPAL_UN }}
- AZ_SVC_PRINCIPAL_PW: ${{ secrets.AZ_SVC_PRINCIPAL_PW }}
```
Commands I used to set that up.
```
az ad sp create-for-rbac --name CIServicePrincipal --role Contributor

az login --service-principal --username <github secret> --password <github secret> --tenant <github secret>

az account set --subscription <github secret>
```

### Summary of this workflow

```
az deployment group create 
  --name addwebapp 
  --resource-group TechExchangeDemoGroup 
  --template-file  /path/to/infra.json 
  --parameters storagePrefix=dubsalot storageSKU=Standard_LRS webAppName=dubsalot

dotnet publish --output cibuild

cd cibuild

az webapp up --runtime "DOTNETCORE|3.1" --os Linux --name dubsalot --debug
```

- The workflow is stored in [.github/main.yml](https://github.com/dubsalot/vscode-container-demo/blob/master/.github/workflows/main.yml)
- The jobs in the build depend on a custom container I use for dev tools. You can find that docker file under .ci/
- The jobs pull dubsalot.azurecr.io/ci/azure from an my personal Azure Container Registry




###  dubsalot.azurecr.io/ci/azure
I don't like how long it takes to initialize a container for each job. It's _probably_ not a big deal in real world scenarios. I feel that they could potentially build an image for JobA when JobB is running: At least some sort of deterministic strategy..

[Eyar Zilberman](https://www.datree.io/resources/github-actions-best-practices) @ datree.io touches on this in a write-up he did for "best practices"


# Composite Actions
[Composites](https://docs.github.com/en/actions/creating-actions/creating-a-composite-run-steps-action) allow one to group a series of steps into one action. For example, a common pattern in your workflows is: step1, step2, step3 then step4. In this scenario, it possibly makes sense to put those 4 steps in a composite action. Your main workflow will now execute the composite action.


### on that note..

There is a thing called [Azure Stack](https://github.com/Azure/login#sample-azure-login-workflow-that-to-run-az-cli-on-azure-stack-hub/?WT.mc_id=devopslab-c9-cxa) that simplifies interaction with Azure cloud from GHA. For example, it probably makes sense to use the [azure/login@releases/v1](https://docs.microsoft.com/en-us/azure-stack/user/ci-cd-github-action-login-cli?WT.mc_id=devopslab-c9-cxa&view=azs-2008) instead of calling **az login**


# Quickstart Workflows
GitHub offers [guidance](https://docs.github.com/en/actions/guides) on pre-built [quickstart templates](https://github.com/actions/starter-workflows) for many common CI/CD patters.


# Feedback
I'd like to hear some feedback from devs and people with more docker/ocp experience. An idea I am playing with is to use the same container image that runs my dev environment for the CI/CD portion of the workflows. This is the image from [part 1](https://github.com/dubsalot/vscode-container-demo/tree/series/part-1-vscode-container). 


As of now, it's essentially the same image. The Dockerfile for the image (dubsalot.azurecr.io/ci/azure) was copied from the vscode demo
