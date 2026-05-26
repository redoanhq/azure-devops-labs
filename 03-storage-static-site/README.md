# Lab 03: Azure Storage Static Website

## Goal

Host a static website using Azure Storage static website hosting.

## Azure Resources Used

- Resource Group: `rg-storage-static-lab`
- Storage Account: `stdevopslabred123`
- Storage Type: `StorageV2`
- Replication: `Standard_LRS`
- Static Website Container: `$web`
- Website URL: `https://stdevopslabred123.z13.web.core.windows.net/`

## Files Uploaded

- `index.html`
- `404.html`

## Steps Completed

1. Created a resource group.
2. Created an Azure Storage Account.
3. Enabled static website hosting.
4. Uploaded `index.html` to the `$web` container.
5. Uploaded `404.html` to the `$web` container.
6. Tested the website URL.
7. Tested the custom 404 page.

## Commands Used

```powershell
az group create --name rg-storage-static-lab --location eastus

az storage account create `
  --name stdevopslabred123 `
  --resource-group rg-storage-static-lab `
  --location eastus `
  --sku Standard_LRS `
  --kind StorageV2 `
  --allow-blob-public-access true

az storage blob service-properties update `
  --account-name stdevopslabred123 `
  --static-website `
  --index-document index.html `
  --404-document 404.html

az storage blob upload `
  --account-name stdevopslabred123 `
  --container-name '$web' `
  --name index.html `
  --file .\03-storage-static-site\index.html `
  --auth-mode key `
  --overwrite

az storage blob upload `
  --account-name stdevopslabred123 `
  --container-name '$web' `
  --name 404.html `
  --file .\03-storage-static-site\404.html `
  --auth-mode key `
  --overwrite