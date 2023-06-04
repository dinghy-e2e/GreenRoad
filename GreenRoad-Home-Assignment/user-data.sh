#! /bin/bash -xe

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Add the user to the sudo group
usermod -aG sudo ubuntu

echo "User 'ubuntu' has been granted root privileges."

#output log
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Install k8s
usermod -g 0 -o ubuntu

apt update && apt upgrade -y

curl -sfL https://get.k3s.io | sh -

# install helm

wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz

tar xvf helm-v3.9.3-linux-amd64.tar.gz

mv linux-amd64/helm /usr/local/bin

rm helm*

# install Services(Prometheus,Node exporter Grafana, 2048 game)

kubectl create ns greenroad

kubectl config view --raw >~/.kube/config

# 2048 

kubectl apply -f /home/ubuntu/2048.yaml 

# monitoring helm

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install monitor-stack prometheus-community/kube-prometheus-stack --namespace greenroad