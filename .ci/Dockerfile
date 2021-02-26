#   az login
#   az acr login --name dubsalot.azurecr.io
#   docker build -t ci/azure .
#   docker tag ci/azure dubsalot.azurecr.io/ci/azure
#   docker push dubsalot.azurecr.io/ci/azure
#



# [Choice] .NET Core version: 3.1, 2.1
ARG VARIANT="3.1"
FROM mcr.microsoft.com/vscode/devcontainers/dotnetcore:0-${VARIANT}


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

#Install Node.js
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

#Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

RUN sudo apt update
RUN sudo apt-get update

RUN sudo apt-get install -y wget apt-transport-https software-properties-common
RUN sudo apt install -y npm

# Download the Microsoft repository GPG keys
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
RUN sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
RUN sudo apt-get update
# Enable the "universe" repositories
RUN sudo add-apt-repository universe
# Install PowerShell
RUN sudo apt-get install -y powershell
# Start PowerShell



RUN dotnet tool install -g dotnet-aspnet-codegenerator --version 3.1.4
RUN export PATH=$HOME/.dotnet/tools:$PATH

RUN sudo apt install -y python3-pip
RUN sudo pip3 install --system decorator

RUN sudo npm install -y -g tfx-cli