
# Prerequisites

- AWS cli configured
- Terraform installed
- Github repositroy access



# Terraform Steps : 

Clone Iac repo

``sh
git clone https://github.com/dinghy-e2e/GreenRoad.git
```
Navigate to GreenRoad\GreenRoad-Home-Assignment

Aws permission:

```sh
$ aws configure
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]: region e.x = us-west-2
Default output format [None]: json
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

![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/a5ee67d0-91cb-42fd-90f5-25094dfc553f)


# Login to kubernetes dashboard

Create token for login

```sh
 kubectl -n kubernetes-dashboard create token admin-user
```
![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/ae5313a7-c449-4c9b-9418-67b7609c4982)

Clean up option

```sh
kubectl -n kubernetes-dashboard delete serviceaccount admin-user
kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
```

Note:
if you want to use SSH you need to create pem file with terraform cmd

```sh
 terraform output private_pem
```
