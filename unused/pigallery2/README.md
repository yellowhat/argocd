# pigallery2

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.1.2](https://img.shields.io/badge/Version-1.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

pigallery2 helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/pigallery2>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <http://bpatrik.github.io/pigallery2>
* <https://github.com/bpatrik/pigallery2>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/pigallery2>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                            | Type   | Default                                                                                                        | Description                                                                |
|--------------------------------|--------|----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| affinity                       | object | `{}`                                                                                                           | Affinity rules                                                             |
| extraEnvVars                   | object | `{}`                                                                                                           | Extra volume definition                                                    |
| extraManifests                 | list   | `[]`                                                                                                           | Extra manifests to deploy as an array                                      |
| extraVolumeMounts              | list   | `[]`                                                                                                           | Extra volume mount definition                                              |
| extraVolumes                   | list   | `[]`                                                                                                           | Extra volume definition                                                    |
| fullnameOverride               | string | `""`                                                                                                           | Replaces the generated name                                                |
| image.pullPolicy               | string | `"Always"`                                                                                                     | Pull policy                                                                |
| image.repository               | string | `"docker.io/bpatrik/pigallery2"`                                                                               | Repository to pull the image from                                          |
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
| persistence.config.mountPath   | string | `"/app/data/config"`                                                                                           | Mount Path                                                                 |
| persistence.config.readOnly    | bool   | `false`                                                                                                        | Mount as read-only                                                         |
| persistence.config.size        | string | `"1Gi"`                                                                                                        | Size                                                                       |
| persistence.db.accessModes     | list   | `["ReadWriteOnce"]`                                                                                            | Access Modes                                                               |
| persistence.db.annotations     | object | `{}`                                                                                                           | Annotations                                                                |
| persistence.db.enabled         | bool   | `false`                                                                                                        | Enable/disable                                                             |
| persistence.db.mountPath       | string | `"/app/data/db"`                                                                                               | Mount Path                                                                 |
| persistence.db.readOnly        | bool   | `false`                                                                                                        | Mount as read-only                                                         |
| persistence.db.size            | string | `"10Gi"`                                                                                                       | Size                                                                       |
| persistence.images.accessModes | list   | `["ReadWriteOnce"]`                                                                                            | Access Modes                                                               |
| persistence.images.annotations | object | `{}`                                                                                                           | Annotations                                                                |
| persistence.images.enabled     | bool   | `false`                                                                                                        | Enable/disable                                                             |
| persistence.images.mountPath   | string | `"/app/data/images"`                                                                                           | Mount Path                                                                 |
| persistence.images.readOnly    | bool   | `false`                                                                                                        | Mount as read-only                                                         |
| persistence.images.size        | string | `"10Gi"`                                                                                                       | Size                                                                       |
| podAnnotations                 | object | `{}`                                                                                                           | Additional pod annotations                                                 |
| podSecurityContext             | object | `{"fsGroup":100,"fsGroupChangePolicy":"OnRootMismatch","runAsGroup":100,"runAsNonRoot":true,"runAsUser":1000}` | Privileges and access control settings for a Pod (all containers in a pod) |
| replicaCount                   | int    | `1`                                                                                                            | Number of replicas                                                         |
| resources                      | object | `{}`                                                                                                           | CPU/MEM resources                                                          |
| securityContext                | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true}`             | Privileges and access control settings for a container                     |
| service.annotations            | object | `{}`                                                                                                           |                                                                            |
| service.labels                 | object | `{}`                                                                                                           |                                                                            |
| service.port                   | int    | `80`                                                                                                           |                                                                            |
| service.type                   | string | `"ClusterIP"`                                                                                                  |                                                                            |
| tolerations                    | list   | `[]`                                                                                                           | Toleration for taints                                                      |
| updateStrategy                 | object | `{}`                                                                                                           | Update strategy                                                            |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
