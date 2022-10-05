# argocd

## Install

```
git clone https://github.com/yellowhat/argocd
cd argocd/
helm dependency build charts/argo-cd
helm install argo-cd charts/argo-cd \
    --namespace argocd \
    --create-namespace
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```

## Update charts

```bash
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm dep update charts/argo-cd
```
