
# Prerequisites

- AWS cli configured
- Terraform installed
- Github repositroy access



# Terraform Steps : 

Aws premmision:

```sh
aws configure
```

Terraform commands:

Download packages
```sh
terraform init
```
Run plan
```sh
terraform plan
```
After verify Resources: 18 added, 0 changed, 0 destroyed

```sh
$ terraform apply -auto-approve
```
Apply complete result:

![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/ccad42dc-d45a-42bf-9ff3-49e56eb34010)

Note:
if you want to use SSH you need to create pem file with terraform cmd

```sh
 terraform output private_pem
```
