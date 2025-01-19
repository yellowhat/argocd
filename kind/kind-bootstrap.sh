#!/usr/bin/env bash
# Bootstrap kind cluster
set -xeuo pipefail

time kind create cluster \
    --config "/opt/kind-config.yaml" \
    --image "kindest/node:$NODE_VER"

# Create host folders
podman exec kind-control-plane mkdir -p \
    /data/loki \
    /data/prometheus \
    /data/jellyfin-config \
    /data/jellyfin-media \
    /data/immich-cache \
    /data/immich-db \
    /data/photo

# Deploy Prometheus CRDs as required by Cilium and ArgoCD
kubectl apply \
    --filename manifests/system/charts/kube-prometheus-stack/charts/crds \
    --recursive \
    --server-side

# CNI - Cilium
cp -r manifests/cilium /tmp/
find /tmp/cilium -type f -exec sed -i "s/mule/127.0.0.1/g" {} \;
kubectl config set-context --current --namespace kube-system
time timeout 120s sh -c """
until kubectl apply --filename /tmp/cilium --recursive --server-side; do
    sleep 2
done
kubectl rollout status deployment cilium-operator
kubectl wait nodes --for condition=Ready --all --timeout 120s
"""
# kubectl config set-context --current --namespace kube-system
# helm template cilium charts/cilium \
#     --dependency-update \
#     --include-crds \
#     --values charts/cilium/ci/bootstrap-values.yaml \
#     --set cilium.k8sServiceHost="127.0.0.1" \
#     --output-dir /tmp/cilium

# ArgoCD
namespace=$(yq .spec.destination.namespace apps/argo-cd.yaml)
kubectl create namespace "$namespace"
kubectl config set-context --current --namespace "$namespace"
time kubectl apply \
    --filename manifests/argo-cd \
    --recursive \
    --server-side
time kubectl rollout status statefulset argo-cd-application-controller --timeout=120s
# time helm upgrade argo-cd charts/argo-cd \
#     --install \
#     --namespace argo-cd \
#     --create-namespace \
#     --dependency-update \
#     --values charts/argo-cd/ci/bootstrap-values.yaml \
#     --wait
argocd login --core

# System - Sealed Secrets
# ansible-vault decrypt ansible/group_vars/all/secrets.yaml
# yq '.tls_public_key' ansible/group_vars/all/secrets.yaml >/tmp/tls.crt
# yq '.tls_private_key' ansible/group_vars/all/secrets.yaml >/tmp/tls.key

# kubectl create namespace system
# kubectl apply --filename manifests/system/charts/sealed-secrets/ --recursive
# kubectl create secret tls sealed-secrets-tls --cert /tmp/tls.crt --key /tmp/tls.key
# kubectl label secret sealed-secrets-tls sealedsecrets.bitnami.com/sealed-secrets-key=active

# Start git-server
kubectl apply --filename kind/git-server.yaml
time kubectl wait --for=condition=Ready --namespace git pod git-server --timeout=60s

bash
