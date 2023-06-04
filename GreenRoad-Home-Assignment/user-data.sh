#!/bin/bash -xe

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Output log
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#//// Install k8s ////#

apt update && apt upgrade -y

curl -sfL https://get.k3s.io | sh -

# export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Install helm
# wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz
# tar xvf helm-v3.9.3-linux-amd64.tar.gz
# mv linux-amd64/helm /usr/local/bin
# rm helm*

#//// Install Services (Prometheus, Node exporter, Grafana, 2048 game) ////#

kubectl create ns greenroad


#//// 2048 ////#
git clone https://github.com/dinghy-e2e/GreenRoad.git

kubectl apply -f /GreenRoad/GreenRoad-Home-Assignment/OPS/2048.yaml

#//// Monitoring install ///#

# replacing url
public_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
sed -i "s/public_ip/$public_ip/g" /GreenRoad/GreenRoad-Home-Assignment/OPS/prometheus-stack.yaml

kubectl apply -f /GreenRoad/GreenRoad-Home-Assignment/OPS/prometheus-stack.yaml
