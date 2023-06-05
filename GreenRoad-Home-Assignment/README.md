
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
terraform apply -auto-approve
```
Apply complete result:

![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/be5a8055-4961-4637-9d43-d6764daee5a2)

# Login to kubernetes dashboard

Create token for login

```sh
 kubectl -n kubernetes-dashboard create token admin-user
```
![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/ae5313a7-c449-4c9b-9418-67b7609c4982)

Note:
if you want to use SSH you need to create pem file with terraform cmd

```sh
 terraform output private_pem
```
