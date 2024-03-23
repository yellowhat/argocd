# jellyfin

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.1.3](https://img.shields.io/badge/Version-1.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.8.9](https://img.shields.io/badge/AppVersion-10.8.9-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

jellyfin for kubernetes

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/jellyfin>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://jellyfin.org>
* <https://github.com/brianmcarey/jellyfin-helm>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/jellyfin>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                            | Type   | Default                         | Description                                                                                |
|--------------------------------|--------|---------------------------------|--------------------------------------------------------------------------------------------|
| affinity                       | object | `{}`                            | Affinity rules                                                                             |
| extraVolumeMounts              | list   | `[]`                            | Extra volume mount definition                                                              |
| extraVolumes                   | list   | `[]`                            | Extra volume definition                                                                    |
| fullnameOverride               | string | `""`                            | Replaces the generated name                                                                |
| image.pullPolicy               | string | `"IfNotPresent"`                | Pull policy                                                                                |
| image.repository               | string | `"docker.io/jellyfin/jellyfin"` | Repository to pull the image from                                                          |
| image.tag                      | string | `""`                            | Image tag, if empty it will get it from the chart's appVersion                             |
| imagePullSecrets               | list   | `[]`                            | Secret name for pulling images from private repository                                     |
| ingress.annotations            | object | `{}`                            |                                                                                            |
| ingress.className              | string | `""`                            |                                                                                            |
| ingress.enabled                | bool   | `false`                         |                                                                                            |
| ingress.hosts                  | list   | `[]`                            |                                                                                            |
| ingress.tls                    | list   | `[]`                            |                                                                                            |
| maxSurge                       | int    | `1`                             | Maximum number of Pods that can be created over the desired number of Pods (RollingUpdate) |
| maxUnavailable                 | int    | `1`                             | Maximum number of Pods that can be unavailable during the update process (RollingUpdate)   |
| nameOverride                   | string | `""`                            | Replaces the name of the chart in the Chart.yaml file                                      |
| nodeSelector                   | object | `{}`                            | Node selection constraint                                                                  |
| persistence.config.accessModes | list   | `["ReadWriteOnce"]`             | Access Modes                                                                               |
| persistence.config.annotations | object | `{}`                            |                                                                                            |
| persistence.config.enabled     | bool   | `false`                         | Enable persistence for the configuration                                                   |
| persistence.config.size        | string | `"1Gi"`                         | Size                                                                                       |
| persistence.media.accessModes  | list   | `["ReadWriteOnce"]`             | Access Modes                                                                               |
| persistence.media.annotations  | object | `{}`                            |                                                                                            |
| persistence.media.enabled      | bool   | `false`                         | Enable persistence for the media                                                           |
| persistence.media.size         | string | `"10Gi"`                        | Size                                                                                       |
| podAnnotations                 | object | `{}`                            | Additional pod annotations                                                                 |
| podSecurityContext             | object | `{}`                            | Privileges and access control settings for a Pod (all containers in a pod)                 |
| replicaCount                   | int    | `1`                             | Number of replicas                                                                         |
| resources                      | object | `{}`                            | CPU/MEM resources                                                                          |
| securityContext                | object | `{}`                            | Privileges and access control settings for a container                                     |
| service.annotations            | object | `{}`                            |                                                                                            |
| service.port                   | int    | `80`                            |                                                                                            |
| service.type                   | string | `"ClusterIP"`                   |                                                                                            |
| strategyType                   | string | `"RollingUpdate"`               | Deployment strategy                                                                        |
| tolerations                    | list   | `[]`                            | Toleration for taints                                                                      |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
