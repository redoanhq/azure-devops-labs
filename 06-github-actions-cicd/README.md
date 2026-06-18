# Lab 06: GitHub Actions CI/CD

## Goal

Build a Docker image, run tests, and push the image to Azure Container Registry using GitHub Actions.

## Azure Resources Used

- Azure Container Registry: `acrredlab123`
- Login Server: `acrredlab123.azurecr.io`

## What the Pipeline Does

- checks out the code
- sets up Python
- installs dependencies
- runs tests with `pytest`
- logs in to ACR
- builds the Docker image
- pushes the image to ACR

## Files

- `app.py`
- `test_app.py`
- `requirements.txt`
- `Dockerfile`
- `.github/workflows/deploy.yml`

## Learning Notes

This lab shows how CI/CD automates testing and image delivery to Azure Container Registry.