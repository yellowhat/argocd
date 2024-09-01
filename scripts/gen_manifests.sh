#!/usr/bin/env bash
# Generate k8s manifests
set -xeuo pipefail

my_values="ci/mule-values.yaml"

# for chart_path in charts/*; do
for app in apps/*; do
    chart_name=$(basename "$app" ".yaml")
    chart_path="charts/${chart_name}"
    rm -rf "manifests/${chart_name}"
    namespace=$(yq .spec.destination.namespace "apps/${chart_name}.yaml")
    values="${chart_path}/values.yaml"
    [ -f "${chart_path}/${my_values}" ] && values="${chart_path}/${my_values}"

    args=(
        # ArgoCD does not override the namespace value, we need to provide it
        --namespace "$namespace"
        --dependency-update
        --include-crds
        --api-versions monitoring.coreos.com/v1
        --output-dir manifests
        --values "$values"
    )

    helm template "$chart_name" "$chart_path" "${args[@]}"
done

rm -rf charts/*/charts
rm -rf charts/*/Chart.lock
