#!/usr/bin/env bash
set -euo pipefail

# Clone
git clone https://github.com/yellowhat/argocd
cd argocd

# Install ArgoCD
helm dependency build charts/argo-cd
helm install argo-cd charts/argo-cd \
    --namespace argocd \
    --create-namespace

# Install ArgoCD Applications
helm template apps/ | kubectl apply -f -
