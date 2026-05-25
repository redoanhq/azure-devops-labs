# Lab 02: Azure VM with Nginx

## Goal

Deploy a Linux virtual machine on Azure, connect with SSH, install Nginx, and serve a custom web page.

## Azure Resources Used

- Resource Group: `rg-vm-nginx-lab`
- Virtual Machine: `vm-nginx-lab`
- Operating System: Ubuntu Server 22.04 LTS
- Web Server: Nginx
- Public IP: `20.40.232.41`
- Inbound Ports:
  - SSH: `22`
  - HTTP: `80`

## Steps Completed

1. Created a resource group.
2. Created an Ubuntu Linux virtual machine.
3. Connected to the VM using SSH.
4. Installed Nginx.
5. Verified Nginx locally with `curl localhost`.
6. Verified the website in a browser.
7. Replaced the default Nginx page with a custom HTML page.

## Commands Used

```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
curl localhost
sudo nano /var/www/html/index.html