#!/usr/bin/env bash
set -euo pipefail

# Install
# - Fedora-Server-netinst-x86_64-36-1.5.iso
# - Custom partition xfs
# - Minimal install

# Update
sudo dnf update -y
sudo hostnamectl hostname "mule"
echo "$(hostname -I) $(hostname)" | sudo tee -a /etc/hosts

# Swap - disable
sudo dnf remove -y zram-generator-defaults
sudo swapoff -a

# CRI-O
sudo dnf install -y cri-o-1.24.1
sudo systemctl daemon-reload
sudo systemctl enable --now crio

# Kubernetes - Install
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sudo sysctl --load
sudo sysctl --system

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo dnf install -y kubelet-1.24.6 kubeadm-1.24.6 kubectl-1.24.6
sudo systemctl enable kubelet

# Helm
curl -L https://get.helm.sh/helm-v3.10.0-linux-amd64.tar.gz |
    sudo tar xz --no-same-owner --directory /usr/local/bin/ --strip-components 1

# Kubernetes - Init
sudo kubeadm init \
    --control-plane-endpoint "$(hostname):6443" \
    --pod-network-cidr "10.1.0.0/16"

# Kubernetes - kubectl
mkdir "${HOME}/.kube"
sudo cp -i /etc/kubernetes/admin.conf "${HOME}/.kube/config"
sudo chown "$(id -u):$(id -g)" "${HOME}/.kube/config"

# Kubernetes - Node taint
kubectl describe nodes | grep -i taint
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
