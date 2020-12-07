# Introduction 
This repo is a basic hello-world introduction to using the Remote Development Containers extension for Visual Studio Code to develop inside a container.

This repo was put together with information from "[Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)" and a few other places


# Technology
The app is a .net core 3.1 app with React and a couple of JSON services. While the application is meant to demo remote containers for vscode, you can also open the webui.sln Solution with Visual Studio 2019 from your Windows host



# Developer Environment
This project was created with a Linux container that contains all the tools you need as a developer for this app. The [VS Code Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension is what enables this method of development.

The goal is: Anyone with vscode and a docker host can open this code base and immediately start contributing without the hassle of installing tons of dependencies.

Initial development was done on a Windows PC in a Linux container, but can also be done on a Mac or Linux PC.

1.	Visual Studio Code - [https://code.visualstudio.com/](https://code.visualstudio.com/)
1.	Docker Desktop (Windows and macOS) [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
1.  Docker CE/EE and Docker Compose<sup>*</sup> [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/) 
1.	Windows Subsystem for Linux<sup>**</sup> [https://docs.microsoft.com/en-us/windows/wsl/install-win10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

<sup><sup>
\* &nbsp;  You'll need to find something compatible with your Linux distrubution  
** WSL2 is much preferred. WSL2 requires Windows 10 1903 or better.  
</sup></sup>



#### VS Code Extensions
Technically, you only need the Remote Containers extension, but the others are useful. Extensions will run locally or in the container for your development environment. You can grab all 3 remote extensions at once by installing [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack).


Local vs. Remote extension is an important detail. For example, if you are developing a C# application, the OmniSharp extension would be installed in the container because that is where the C#/.net work is being done. On the other hand, other extensions like Themes and Remote Container are installed locally.

Extension needed for remote container development
1. [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Other useful extensions for remote development with vscode
1. [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
1. [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
1. [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)


# Steps to Begin Coding

```
git clone https://github.com/dubsalot/vscode-container-demo
open vscode
ctrl + shift + p for Windows & Linux or command + shift + p for mac
    -> select Remote Containers: Open Folder in Container 
    -> Browse to folder above and select vscode-container-demo 
    -> Open
```  

When the vscode loads this for the first time, it will prompt you to add required assests. Click "Yes."  This will add a .vscode folder launch.json and tasks.json. This can be added to source control, but it's more of a team decision to do so. Since I'm creating this in a silo, I left it out of source control.  


If you type code 'vscode-container-demo' to open the folder on startup, vscode will detect the .devcontainer folder and ask you if you want to open the folder in a container. Either way is fine, but be wary of making changes within folder mounted in the container. The container [might not realize a file changed](https://forums.docker.com/t/file-system-events-not-correctly-propagating-from-host-to-container/15201).


# Have Fun and Experiment
Note that you can also try Ctrl/Cmd+Shift+p -> [Remote Containers: Open Repository in Container Volume](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-a-git-repository-or-github-pr-in-an-isolated-container-volume)

Microsoft has provided [samples that you can try](https://code.visualstudio.com/docs/remote/containers#_quick-start-try-a-development-container)

You can also use [docker compose](https://docs.docker.com/compose/install/) to run multiple containers. For example, maybe your client side app is in a container and your API is in a separate container.


You should also try the other methods of Remote development like WSL directly or SSH. For example, you can develop and debug your codebase in WSL2 from Windows like so:
```
code --remote wsl+Ubuntu-20.04 /mnt/d/path/to/vscode-container-demo

```

:rocket: Happy Coding! :rocket:
