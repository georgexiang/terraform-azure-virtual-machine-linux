# Terraform configuration for deploying a Linux (Ubuntu) virtual machine on Azure

## Deployment of the virtual machine using Terraform

Conduct the initialization with the following command:

``` terraform
  terraform init
```
Make sure your Terraform configuration files are in the desired format, by using:

``` terraform
terraform fmt
```

Validate your Terraform configuration

``` terraform
terraform validate
```

Create a Terraform plan by running:

``` terraform
terraform plan -out tfplan
```

Deploy the Ubuntu VM on Azure executing:

``` terraform
terraform apply tfplan
```

## Destruction of the virtual machine using Terraform

Destroy the Ubuntu VM on Azure executing:

``` terraform
terraform destroy
```