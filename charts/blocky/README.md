# blocky

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.24](https://img.shields.io/badge/AppVersion-v0.24-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

blocky helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/blocky>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://0xerr0r.github.io/blocky>
* <https://github.com/0xERR0R/blocky>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/blocky>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                             | Type   | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Description                                                                                |
|---------------------------------|--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| affinity                        | object | `{}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Affinity rules                                                                             |
| config                          | object | `{"blocking":{"clientGroupsBlock":{"default":["ads"]},"denylists":{"ads":["https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"]}},"bootstrapDns":["tcp+udp:1.1.1.1",{"ips":["185.95.218.42"],"upstream":"https://dns.digitale-gesellschaft.ch/dns-query"}],"ports":{"dns":5353,"http":8080,"https":8443,"tls":8053},"prometheus":{"enable":true,"path":"/metrics"},"upstreams":{"groups":{"default":["tcp-tls:1.1.1.1","tcp-tls:1.0.0.1","tcp-tls:dns.digitale-gesellschaft.ch:853","https://dns.digitale-gesellschaft.ch/dns-query","tcp-tls:fdns1.dismail.de:853","tcp-tls:fdns2.dismail.de:853","tcp-tls:dnsforge.de:853","https://dnsforge.de/dns-query","tcp-tls:clean.dnsforge.de:853","https://clean.dnsforge.de/dns-query","https://anycast.uncensoreddns.org/dns-query","https://unicast.uncensoreddns.org/dns-query","tcp-tls:dns3.digitalcourage.de:853"]},"strategy":"parallel_best"}}` | Config file (https://github.com/0xERR0R/blocky/blob/main/docs/config.yml)                  |
| extraEnvVars                    | object | `{}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Extra volume definition                                                                    |
| extraVolumeMounts               | list   | `[]`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Extra volume mount definition                                                              |
| extraVolumes                    | list   | `[]`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Extra volume definition                                                                    |
| fullnameOverride                | string | `""`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Replaces the generated name                                                                |
| image.pullPolicy                | string | `"IfNotPresent"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Pull policy                                                                                |
| image.repository                | string | `"ghcr.io/0xerr0r/blocky"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Repository to pull the image from                                                          |
| image.tag                       | string | `""`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Image tag, if empty it will get it from the chart's appVersion                             |
| imagePullSecrets                | list   | `[]`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Secret name for pulling images from private repository                                     |
| maxSurge                        | int    | `1`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Maximum number of Pods that can be created over the desired number of Pods (RollingUpdate) |
| maxUnavailable                  | int    | `0`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Maximum number of Pods that can be unavailable during the update process (RollingUpdate)   |
| metrics                         | object | `{"enabled":false,"prometheusRule":{"enabled":false,"labels":{},"rules":[]},"serviceMonitor":{"interval":"30s","jobLabel":"","labels":{},"podTargetLabels":[],"scrapeTimeout":"10s","targetLabels":[]}}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Enable metrics                                                                             |
| metrics.prometheusRule          | object | `{"enabled":false,"labels":{},"rules":[]}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Create and configure PrometheusRules                                                       |
| metrics.serviceMonitor          | object | `{"interval":"30s","jobLabel":"","labels":{},"podTargetLabels":[],"scrapeTimeout":"10s","targetLabels":[]}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Create and configure serviceMonitor                                                        |
| metrics.serviceMonitor.interval | string | `"30s"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Interval at which Prometheus should scrape metrics                                         |
| metrics.serviceMonitor.jobLabel | string | `""`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | The Kubernetes `Endpoints` label to use as the Prometheus job name                         |
| metrics.serviceMonitor.labels   | object | `{}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Additional labels                                                                          |
| metrics.serviceMonitor.podTargetLabels | list | `[]` | PodTargetLabels transfers labels on the Kubernetes `Pod`` onto the created metrics. |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout after which the scrape is ended |
| metrics.serviceMonitor.targetLabels | list | `[]` | TargetLabels transfers labels from the Kubernetes `Service`` onto the created metrics. |
| nameOverride | string | `""` | Replaces the name of the chart in the Chart.yaml file |
| nodeSelector | object | `{}` | Node selection constraint |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | Privileges and access control settings for a Pod (all containers in a pod) |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` | CPU/MEM resources |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"add":["NET_BIND_SERVICE"],"drop":["ALL"]},"readOnlyRootFilesystem":true}` | Privileges and access control settings for a container |
| service | object | `{"annotations":{},"externalTrafficPolicy":"Local","labels":{},"ports":{"dns_tcp":53,"dns_udp":53,"http":80,"https":443},"type":"ClusterIP"}` | Service |
| strategyType | string | `"RollingUpdate"` | Deployment strategy |
| tolerations | list | `[]` | Toleration for taints |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)