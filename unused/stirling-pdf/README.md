# stirling-pdf

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.1.35](https://img.shields.io/badge/Version-1.1.35-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.37.1](https://img.shields.io/badge/AppVersion-0.37.1-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

stirling-pdf helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/stirling-pdf>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://github.com/Stirling-Tools/Stirling-PDF>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/stirling-pdf>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                      | Type   | Default                                                                                                                                                            | Description                                                                                |
|--------------------------|--------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| affinity                 | object | `{}`                                                                                                                                                               | Affinity rules                                                                             |
| annotations              | object | `{}`                                                                                                                                                               | Additional deployment annotations                                                          |
| extraEnvVars             | object | `{}`                                                                                                                                                               | Extra volume definition                                                                    |
| extraEnvVarsSecret       | object | `{}`                                                                                                                                                               | Extra environment variables from secrets                                                   |
| extraManifests           | list   | `[]`                                                                                                                                                               | Extra manifests to deploy as an array                                                      |
| fullnameOverride         | string | `""`                                                                                                                                                               | Replaces the generated name                                                                |
| image.pullPolicy         | string | `"Always"`                                                                                                                                                         | Pull policy                                                                                |
| image.repository         | string | `"ghcr.io/yellowhat/registry/stirling-pdf"`                                                                                                                        | Repository to pull the image from                                                          |
| image.tag                | string | `""`                                                                                                                                                               | Image tag, if empty it will get it from the chart's appVersion                             |
| imagePullSecrets         | list   | `[]`                                                                                                                                                               | Secret name for pulling images from private repository                                     |
| ingress.annotations      | object | `{}`                                                                                                                                                               |                                                                                            |
| ingress.enabled          | bool   | `false`                                                                                                                                                            |                                                                                            |
| ingress.hosts            | list   | `[]`                                                                                                                                                               |                                                                                            |
| ingress.ingressClassName | string | `""`                                                                                                                                                               |                                                                                            |
| ingress.tls              | list   | `[]`                                                                                                                                                               |                                                                                            |
| maxSurge                 | int    | `1`                                                                                                                                                                | Maximum number of Pods that can be created over the desired number of Pods (RollingUpdate) |
| maxUnavailable           | int    | `0`                                                                                                                                                                | Maximum number of Pods that can be unavailable during the update process (RollingUpdate)   |
| nameOverride             | string | `""`                                                                                                                                                               | Replaces the name of the chart in the Chart.yaml file                                      |
| nodeSelector             | object | `{}`                                                                                                                                                               | Node selection constraint                                                                  |
| podAnnotations           | object | `{}`                                                                                                                                                               | Additional pod annotations                                                                 |
| podSecurityContext       | object | `{}`                                                                                                                                                               | Privileges and access control settings for a Pod (all containers in a pod)                 |
| replicaCount             | int    | `1`                                                                                                                                                                | Number of replicas                                                                         |
| resources                | object | `{}`                                                                                                                                                               | CPU/MEM resources                                                                          |
| securityContext          | object | `{"allowPrivilegeEscalation":false,"capabilities":{"add":["CAP_CHOWN","CAP_FOWNER","CAP_SETUID","CAP_SETGID"],"drop":["NET_RAW"]},"readOnlyRootFilesystem":false}` | Privileges and access control settings for a container                                     |
| service.annotations      | object | `{}`                                                                                                                                                               |                                                                                            |
| service.labels           | object | `{}`                                                                                                                                                               |                                                                                            |
| service.port             | int    | `8080`                                                                                                                                                             |                                                                                            |
| service.type             | string | `"ClusterIP"`                                                                                                                                                      |                                                                                            |
| strategyType             | string | `"RollingUpdate"`                                                                                                                                                  | Deployment strategy                                                                        |
| tolerations              | list   | `[]`                                                                                                                                                               | Toleration for taints                                                                      |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
