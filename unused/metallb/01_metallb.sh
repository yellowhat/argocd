#!/usr/bin/env bash
set -euo pipefail

helm repo add metallb https://metallb.github.io/metallb
helm install metallb metallb/metallb \
    --version 0.13.5 \
    --namespace metallb \
    --create-namespace \
    --wait

cat <<EOF | kubectl apply --filename -
---
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: pool
  namespace: metallb
spec:
  addresses:
    - 192.168.178.200-192.168.178.220

---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: middle
  namespace: metallb
spec:
  ipAddressPools:
    - pool
EOF
