# Introduction 
This is a repo that will be used as a demo of yaml pipelines in Azure DevOps for Tech Exchange at Regions. It will include a multi-stage pipeline creates a build, runs some unit tests, deploys the build to multiple environments. It will possibly include some “cloud native” deployments, but the scope of the project is to demo the pipelines. 

# Technologies 
As of now, the application is a simple hello-world web application. If there is time, I would like to learn Azure Functions and include that in the demo.
1.	React with TypeScript

# Devloper Environment
This project is maintained with [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) and inside a container that will include the required development tools. For a Windows PC this requires WSL2 and Docker Desktop along with a couple VS Code extensions.

1.	Visual Studio Code
2.	Windows Subsystem for Linux  (WSL2)
3.	Docker Desktop

### VS Code Extensions
This project is maintained with VS Code Remote Development and inside a container that will include the required development tools. For a Windows PC this requires WSL2 and Docker Desktop along with a couple VS Code extensions.
1. [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
1. [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
3. [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


# Developer Steps
git clone https://dubsalot.visualstudio.com/regionsdemo/_git/regionsdemo
code regionsdemo
npm run start   #this will start as webserver in the copntainer that you can connect to from your PC


# TODO 
Add vscode steps above e.g. ctrl + shift + p
Add some linux and mac steps