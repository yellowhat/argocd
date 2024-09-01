#!/usr/bin/env bash
# Deploy manifests and wait
set -xeuo pipefail

# APP=argo-cd
# APP=jellyfin
APP=immich
# APP=system
# APP=tailscale

kubectl config set-context --current --namespace git
kubectl cp "manifests/${APP}" git-server:/git/repo
kubectl exec git-server -- sh -c "cd /git/repo && git add . && git commit -m init"

# Required as we are using non-default names
export ARGOCD_REDIS_NAME=argo-cd-redis

# Required to use the argocd cli
kubectl config set-context --current --namespace argo-cd

yq eval '.spec.source.path = ".", .spec.source.repoURL = "git://git-server.git.svc/repo"' "apps/${APP}.yaml" \
    | kubectl apply --filename -

# system has a transitional Degraded state
# https://github.com/argoproj/argo-cd/issues/6013
time argocd app wait "$APP" --sync --timeout 300
time argocd app wait "$APP" --operation --timeout 300
time argocd app wait "$APP" --health --timeout 300
# Ensure the final status is Synced
time argocd app wait "$APP" --sync --timeout 300

# time argocd app wait "$APP" --timeout 300

# kubectl --namespace argo-cd wait --for=jsonpath='{.status.health.status}=Healthy' app "$APP" --timeout=10s || \
#     {
#         echo "App failed to sync"
#         kubectl --namespace argo-cd describe app "$APP"
#         kubectl config set-context --current --namespace=argo-cd
#         argocd app logs "$APP"
#         exit 111
#     }
