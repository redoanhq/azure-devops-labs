# Lab 05: Docker + Azure Container Registry

## Goal

Build a small Flask app, containerize it with Docker, run it locally, and push the image to Azure Container Registry.

## App

- Framework: Flask
- Local port: `5000`

## Azure Resources Used

- Resource Group: `rg-acr-lab`
- Azure Container Registry: `acrredlab123`
- Login Server: `acrredlab123.azurecr.io`

## Docker Image

- Local image: `docker-acr-lab:v1`
- ACR image: `acrredlab123.azurecr.io/docker-acr-lab:v1`

## Steps Completed

1. Created a Flask app.
2. Wrote a Dockerfile.
3. Built the Docker image locally.
4. Ran the container locally.
5. Verified the app in the browser.
6. Created Azure Container Registry.
7. Logged Docker into ACR.
8. Tagged the image for ACR.
9. Pushed the image to ACR.
10. Verified the image tag in ACR.

## Commands Used

```powershell
docker build -t docker-acr-lab:v1 .
docker run -d -p 5000:5000 --name docker-acr-lab-container docker-acr-lab:v1
az provider register --namespace Microsoft.ContainerRegistry --wait
az acr create --resource-group rg-acr-lab --name acrredlab123 --sku Basic --admin-enabled true
az acr login --name acrredlab123
docker tag docker-acr-lab:v1 acrredlab123.azurecr.io/docker-acr-lab:v1
docker push acrredlab123.azurecr.io/docker-acr-lab:v1
az acr repository show-tags --name acrredlab123 --repository docker-acr-lab --output table