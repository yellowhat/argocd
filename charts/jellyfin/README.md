# jellyfin

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.6.11](https://img.shields.io/badge/Version-1.6.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.9.10](https://img.shields.io/badge/AppVersion-10.9.10-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

jellyfin helm chart

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

| Key                            | Type   | Default                                                                                                        | Description                                                                |
|--------------------------------|--------|----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| affinity                       | object | `{}`                                                                                                           | Affinity rules                                                             |
| annotations                    | object | `{}`                                                                                                           | Additional statefulset annotations                                         |
| extraManifests                 | list   | `[]`                                                                                                           | Extra manifests to deploy as an array                                      |
| extraVolumeMounts              | list   | `[]`                                                                                                           | Extra volume mount definition                                              |
| extraVolumes                   | list   | `[]`                                                                                                           | Extra volume definition                                                    |
| fullnameOverride               | string | `""`                                                                                                           | Replaces the generated name                                                |
| image.pullPolicy               | string | `"IfNotPresent"`                                                                                               | Pull policy                                                                |
| image.repository               | string | `"docker.io/jellyfin/jellyfin"`                                                                                | Repository to pull the image from                                          |
| image.tag                      | string | `""`                                                                                                           | Image tag, if empty it will get it from the chart's appVersion             |
| imagePullSecrets               | list   | `[]`                                                                                                           | Secret name for pulling images from private repository                     |
| ingress.annotations            | object | `{}`                                                                                                           |                                                                            |
| ingress.enabled                | bool   | `false`                                                                                                        |                                                                            |
| ingress.hosts                  | list   | `[]`                                                                                                           |                                                                            |
| ingress.ingressClassName       | string | `""`                                                                                                           |                                                                            |
| ingress.tls                    | list   | `[]`                                                                                                           |                                                                            |
| nameOverride                   | string | `""`                                                                                                           | Replaces the name of the chart in the Chart.yaml file                      |
| nodeSelector                   | object | `{}`                                                                                                           | Node selection constraint                                                  |
| persistence.config.accessModes | list   | `["ReadWriteOnce"]`                                                                                            | Access Modes                                                               |
| persistence.config.annotations | object | `{}`                                                                                                           | Annotations                                                                |
| persistence.config.enabled     | bool   | `false`                                                                                                        | Enable/disable                                                             |
| persistence.config.mountPath   | string | `"/config"`                                                                                                    | Mount Path                                                                 |
| persistence.config.readOnly    | bool   | `false`                                                                                                        | Mount as read-only                                                         |
| persistence.config.size        | string | `"1Gi"`                                                                                                        | Size                                                                       |
| persistence.media.accessModes  | list   | `["ReadWriteOnce"]`                                                                                            | Access Modes                                                               |
| persistence.media.annotations  | object | `{}`                                                                                                           | Annotations                                                                |
| persistence.media.enabled      | bool   | `false`                                                                                                        | Enable/disable                                                             |
| persistence.media.mountPath    | string | `"/media"`                                                                                                     | Mount Path                                                                 |
| persistence.media.readOnly     | bool   | `false`                                                                                                        | Mount as read-only                                                         |
| persistence.media.size         | string | `"10Gi"`                                                                                                       | Size                                                                       |
| podAnnotations                 | object | `{}`                                                                                                           | Additional pod annotations                                                 |
| podSecurityContext             | object | `{"fsGroup":100,"fsGroupChangePolicy":"OnRootMismatch","runAsGroup":100,"runAsNonRoot":true,"runAsUser":1000}` | Privileges and access control settings for a Pod (all containers in a pod) |
| replicaCount                   | int    | `1`                                                                                                            | Number of replicas                                                         |
| resources                      | object | `{}`                                                                                                           | CPU/MEM resources                                                          |
| securityContext                | object | `{"capabilities":{"drop":["ALL"]}}`                                                                            | Privileges and access control settings for a container                     |
| service.annotations            | object | `{}`                                                                                                           |                                                                            |
| service.labels                 | object | `{}`                                                                                                           |                                                                            |
| service.port                   | int    | `80`                                                                                                           |                                                                            |
| service.type                   | string | `"ClusterIP"`                                                                                                  |                                                                            |
| tolerations                    | list   | `[]`                                                                                                           | Toleration for taints                                                      |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
