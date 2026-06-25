# Lab 07: Terraform on Azure

## Goal

Use Terraform to provision Azure infrastructure as code instead of clicking through the portal.

## What I Built

- Azure Resource Group
- Azure Storage Account
- Static website enabled on the storage account

## Terraform Files

- `versions.tf`
- `main.tf`
- `variables.tf`
- `outputs.tf`
- `terraform.tfvars`

## Key Outputs

- Resource group name
- Storage account name
- Static website URL

## What I Learned

- How Terraform initializes Azure providers
- How `terraform plan` shows proposed changes
- How `terraform apply` creates resources in Azure
- How to read Terraform outputs
- How to destroy resources cleanly when finished

## Notes

Terraform first tried to register Azure resource providers automatically, but the subscription state caused problems. I then used a new Azure account and successfully ran `terraform apply`.

## Useful Commands

```powershell
terraform init
terraform plan
terraform apply
terraform output
terraform destroy