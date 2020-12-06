# Introduction 
This is a repo that will be used as a demo of yaml pipelines in Azure DevOps for Tech Exchange. It will include a multi-stage pipeline creates a build, runs some unit tests, deploys the build to multiple environments. It will possibly include some “cloud native” deployments, but the scope of the project is to demo the pipelines. 

# Technologies 
As of now, the application is a simple hello-world web application. If there is time, I would like to learn Azure Functions and include that in the demo.
1.	React with TypeScript
2.  dotnet core web api project

# Devloper Environment
This project is maintained with [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) and inside a container that will include the required development tools. For a Windows PC this requires WSL2 and Docker Desktop along with a couple VS Code extensions.

1.	Visual Studio Code
1.	Docker Desktop (Window and MAC)
1.  Docker CE/EE and Docker Compose (Linux)
1.	Windows Subsystem for Linux  (WSL2)   (Windows)

### VS Code Extensions
This project is maintained with VS Code Remote Development and inside a container that will include the required development tools. For a Windows PC this requires WSL2 and Docker Desktop along with a couple VS Code extensions.
1. [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
1. [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
1. [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Note: extensions can run both locally or in the container for your development environment.I find having the docker extension is useful locally where I have docker installed. However, I don't need it inside the container. That would make sense if you were running docker in docker.


# Developer Steps

```shell
git clone https://github.com/dubsalot/vscode-container-demo
code
ctrl + shift + p 
    -> select Remote Containers: Open Folder in Remote Container 
    -> Browse to folder above and select vscode-container-demo 
    -> Open
```

:rocket: Happy Coding!
