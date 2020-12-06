# Introduction 
This repo is a basic hello-world introduction to using Remote Development Containers extension for Visual Studio Code to develop inside a container.

This repo was put together with information from "[Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)" and a few other places


# Technology
The app is a .net core 3.1 app with React and a couple of json services. While the application is meant to demo remote containers for vscode, you can also open with Visual Studio from your Windows host



# Developer Environment
This project is maintained with [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) and inside a container that includes everything you need to run and debug the application. 

Initial development was a Windows PC in a Linux container. It will would work on Linux or Mac in theory.

1.	Visual Studio Code
1.	Docker Desktop (Window and MAC)
1.  Docker CE/EE and Docker Compose (Linux)
1.	Windows Subsystem for Linux  (WSL2)   (Windows)

**Note:** WSL2 requires Windows 10 1903 or better.


#### VS Code Extensions
Technically, you only need the Remote Containers extension, but the others are useful. Extensions can run locally or in the container for your development environment.

**Note:** Local vs. Remote extension is an important detail. For example, if you are developing a C# application, OmniSharp extension would be installed in the container. Other extensions, such as Themes and Remote Container are installed locally.
1. [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
1. [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
1. [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)



# Developer Steps

```
git clone https://github.com/dubsalot/vscode-container-demo
code
ctrl + shift + p 
    -> select Remote Containers: Open Folder in Remote Container 
    -> Browse to folder above and select vscode-container-demo 
    -> Open
```

**Note:** if you 'type code vscode-container-demo' to open the folder on startup, vscode will detect the .devcontainer folder and ask you if you want to open the folder in a container. Either way is fine.


#### Have fun and Experiment
Note that you can also try Ctrl+Shift+p -> [Remote Containers: Open Repository in Container Volume](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-a-git-repository-or-github-pr-in-an-isolated-container-volume)

Microsoft has provided [samples that you can try](https://code.visualstudio.com/docs/remote/containers#_quick-start-try-a-development-container)

You can also use docker compose to run multiple containers. For example, maybe your client side app is in a container and your API is in a separate container.


You should also try the other methods of Remote development. For example, you can develop and debug your cod ebase in WSL2 from Windows like so:
```
code --remote wsl+Ubuntu-20.04 /mnt/d/path/to/vscode-container-demo

```

:rocket: Happy Coding! :rocket:
