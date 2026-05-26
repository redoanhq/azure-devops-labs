# Lab 04: Azure RBAC for Blob Storage

## Goal

Understand Azure RBAC data-plane permissions by assigning `Storage Blob Data Contributor` and uploading a blob using Azure AD login authentication.

## Azure Resources Used

- Resource Group: `rg-rbac-lab`
- Storage Account: `strbaclabred123`
- Container: `rbacdemo`
- Role Assigned: `Storage Blob Data Contributor`

## What Happened

I created a storage account and tried to upload a blob using:

```powershell
--auth-mode login

The upload failed because Azure Storage blob uploads require data-plane permissions.

I fixed the issue by assigning my user the following role at the storage account scope:

Storage Blob Data Contributor
Management Plane vs Data Plane
Management plane permissions allow users to create and manage Azure resources, such as:

resource groups
storage accounts
virtual machines
networking resources
Data plane permissions allow users to work with the data inside a resource, such as:

uploading blobs
downloading blobs
listing blob containers
deleting blob objects
Commands Used
az group create --name rg-rbac-lab --location eastus

az storage account create `
  --name strbaclabred123 `
  --resource-group rg-rbac-lab `
  --location eastus `
  --sku Standard_LRS `
  --kind StorageV2 `
  --allow-blob-public-access true `
  --min-tls-version TLS1_2

az storage container create `
  --account-name strbaclabred123 `
  --name rbacdemo `
  --auth-mode login

az ad signed-in-user show --query id --output tsv

az storage account show `
  --name strbaclabred123 `
  --resource-group rg-rbac-lab `
  --query id `
  --output tsv

az role assignment create `
  --assignee YOUR_USER_OBJECT_ID `
  --role "Storage Blob Data Contributor" `
  --scope STORAGE_ACCOUNT_RESOURCE_ID

az storage blob upload `
  --account-name strbaclabred123 `
  --container-name rbacdemo `
  --name test.txt `
  --file .\04-azure-rbac-storage\test.txt `
  --auth-mode login `
  --overwrite

az storage blob list `
  --account-name strbaclabred123 `
  --container-name rbacdemo `
  --auth-mode login `
  --output table

az storage blob download `
  --account-name strbaclabred123 `
  --container-name rbacdemo `
  --name test.txt `
  --file .\04-azure-rbac-storage\downloaded-test.txt `
  --auth-mode login `
  --overwrite
What I Learned
Azure has management-plane and data-plane permissions
Creating a storage account does not always mean you can upload blobs with Azure AD auth
Storage Blob Data Contributor allows blob upload/download operations
RBAC role assignments can take time to apply
--auth-mode login uses Azure AD/RBAC permissions
--auth-mode key uses storage account keys