
# Prerequisites

- AWS cli configured
- Terraform installed
- Github repositroy access



# Terraform Steps : 

Clone Iac repo

```sh
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

- Now we need to login into our ec2 for create token

make a new file(keypair.pem)

```sh
 terraform output private_pem
```
Copy RSA PRIVATE KEY into keypair.pem and save

Run chmod for permission

```sh
chomd 400 keypair.pem
```
SSH login command for creating token 

```sh
ssh -i keypair.pem ubuntu@<public_dns>
```
** Wecan copy the public dns ip from terrafrom terminal or aws ui

Create token for login

```sh
 kubectl -n kubernetes-dashboard create token admin-user
```
![image](https://github.com/dinghy-e2e/GreenRoad/assets/103927731/ae5313a7-c449-4c9b-9418-67b7609c4982)

Now we need to login into our ec2 for create token

Note:

Clean up option for admin user

```sh
kubectl -n kubernetes-dashboard delete serviceaccount admin-user
kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
```

```sh
 terraform output private_pem
```
