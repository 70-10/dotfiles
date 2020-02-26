#!/bin/bash

# azure-cli
brew install azure-cli

# .Net SDK
brew cask install dotnet-sdk
brew tap isen-ng/dotnet-sdk-versions

dotnet tool install --global dotnet-ef --version 3.1.1

# Azure Functions Tools
brew tap azure/functions
brew install azure-functions-core-tools

# Other
brew cask install azure-data-studio visual-studio microsoft-teams
