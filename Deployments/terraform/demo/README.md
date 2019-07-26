# Azure Terraform Deployments Example

This folder contains example deployments you can use to get familiar with Azure and understand how you can deploy complex infrastructure using Terraform configuration files and modules.

The besic steps to deploy a Demo infrastructure in your own subscription are the following:

1. open a powershell prompt and login to your azure subscription with:

```powershell
az login
```

2. Go in the 1st demo folder with:

```powershell
cd infra
```

3. Edit the main.tf file to replace the example subscription id with your own.
4. Initialise and deploy the base network and keyvault infrastructure with:

```powershell
terraform init
terraform apply
```

5. Go in the fortigate folder, copy the fwconfig/coreA-lic-demo.conf to fwconfig/coreA-lic.conf and fwconfig/coreB-lic-demo.conf to fwconfig/coreB-lic.conf
6. Replace the license section at the bottom of the files with your own fortigate license
7. Initialise and deploy the HA firewall infrastructure with:

```powershell
terraform init
terraform apply
```

8. Go in the demo-servers folder and nitialise and deploy the demo server infrastructure with:

```powershell
terraform init
terraform apply
```

9. In the Azure Portal look at the Demo-FW-B-EXT-PubIP resource in the Demo-Core-FWCore-RG resourcegroup to obtain the IP address you will need to connect to the demo web server and jumpbox with:

```text
http://<Demo-FW-B-EXT-PubIP>

RDP to <Demo-FW-B-EXT-PubIP>
```
