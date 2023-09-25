# Build a simple streaming solution in Azure

## Azure Services

These are all the services used for this example

- Azure streaming job
- Eventhub
- Storage Account

## Architecture

TBD

## Get started

Clone this repo and browse into the main directory to execute the following commands

```
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars
```

Finally, when you done with your work, you can clean up this repository with the following command

```
terraform destroy -var-file=variables.tfvars
```

Here's the same .tfvars file I used, feel free to change the values to suite your needs

```
rgname = "rg-use-streaming"
rglocation = "eastus"
storage_account_name = "saeuskstreammain"
container_name = "cteuskstreamsink"
namespace_name = "ehnseusstreaming"
eventhub_name = "eheusstreaming"
partition_count = 2
stream_analytics_job_name = "simple"
```
