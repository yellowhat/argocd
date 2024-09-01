# tailscale

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.0.8](https://img.shields.io/badge/Version-1.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.72.0](https://img.shields.io/badge/AppVersion-v1.72.0-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

tailscale helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/tailscale>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://tailscale.com>
* <https://github.com/tailscale/tailscale>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/tailscale>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                | Type   | Default                                                                                            | Description                                                                |
|--------------------|--------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| affinity           | object | `{}`                                                                                               | Affinity rules                                                             |
| extraEnvVars       | object | `{}`                                                                                               | Extra environment variables                                                |
| extraEnvVarsSecret | object | `{}`                                                                                               | Extra environment variables from secrets                                   |
| extraManifests     | list   | `[]`                                                                                               | Extra manifests to deploy as an array                                      |
| extraVolumeMounts  | list   | `[{"mountPath":"/tmp","name":"tmp"}]`                                                              | Extra volume mount definition                                              |
| extraVolumes       | list   | `[{"emptyDir":{},"name":"tmp"}]`                                                                   | Extra volume definition                                                    |
| fullnameOverride   | string | `""`                                                                                               | Replaces the generated name                                                |
| image.pullPolicy   | string | `"IfNotPresent"`                                                                                   | Pull policy                                                                |
| image.repository   | string | `"ghcr.io/tailscale/tailscale"`                                                                    | Repository to pull the image from                                          |
| image.tag          | string | `""`                                                                                               | Image tag, if empty it will get it from the chart's appVersion             |
| imagePullSecrets   | list   | `[]`                                                                                               | Secret name for pulling images from private repository                     |
| nameOverride       | string | `""`                                                                                               | Replaces the name of the chart in the Chart.yaml file                      |
| nodeSelector       | object | `{}`                                                                                               | Node selection constraint                                                  |
| podAnnotations     | object | `{}`                                                                                               | Additional pod annotations                                                 |
| podSecurityContext | object | `{"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}`                                       | Privileges and access control settings for a Pod (all containers in a pod) |
| resources          | object | `{}`                                                                                               | CPU/MEM resources                                                          |
| securityContext    | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true}` | Privileges and access control settings for a container                     |
| stateSecretName    | string | `"tailscale-state"`                                                                                | k8s secret name where to store the state                                   |
| tolerations        | list   | `[]`                                                                                               | Toleration for taints                                                      |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
