# ebpf-exporter

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.4.1](https://img.shields.io/badge/AppVersion-v2.4.1-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

ebpf_exporter helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/ebpf-exporter>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| dongjiang | <dongjiang1989@126.com> |     |

## Source Code

* <https://github.com/cloudflare/ebpf_exporter>
* <https://github.com/kubeservice-stack/kubservice-charts/tree/master/charts/kubeservice-ebpf-exporter>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/blocky>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                                           | Type   | Default                                                                                                                                                                                                                            | Description                                                    |
|-----------------------------------------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| affinity                                      | object | `{}`                                                                                                                                                                                                                               | Affinity rules                                                 |
| args                                          | list   | `["--config.dir","/examples/","--web.listen-address","0.0.0.0:9435","--config.names","timers,uprobe,usdt,shrinklat,biolatency,accept-latency,bpf-jit,cachestat,cgroup,llcstat,raw-tracepoints,tcp-syn-backlog,tcp-window-clamps"]` | Args to the command                                            |
| command                                       | list   | `["/ebpf_exporter"]`                                                                                                                                                                                                               | Command to run on start                                        |
| extraVolumeMounts                             | list   | `[{"mountPath":"/sys/kernel/debug","name":"kernel"},{"mountPath":"/lib/modules/","name":"modules"}]`                                                                                                                               | Extra volume mount definition                                  |
| extraVolumes                                  | list   | `[{"hostPath":{"path":"/sys/kernel/debug","type":"Directory"},"name":"kernel"},{"hostPath":{"path":"/lib/modules/","type":"Directory"},"name":"modules"}]`                                                                         | Extra volume definition                                        |
| fullnameOverride                              | string | `""`                                                                                                                                                                                                                               | Replaces the generated name                                    |
| image.pullPolicy                              | string | `"IfNotPresent"`                                                                                                                                                                                                                   | Pull policy                                                    |
| image.repository                              | string | `"ghcr.io/cloudflare/ebpf_exporter"`                                                                                                                                                                                               | Repository to pull the image from                              |
| image.tag                                     | string | `""`                                                                                                                                                                                                                               | Image tag, if empty it will get it from the chart's appVersion |
| imagePullSecrets                              | list   | `[]`                                                                                                                                                                                                                               | Secret name for pulling images from private repository         |
| nameOverride                                  | string | `""`                                                                                                                                                                                                                               | Replaces the name of the chart in the Chart.yaml file          |
| nodeSelector                                  | object | `{}`                                                                                                                                                                                                                               | Node selection constraint                                      |
| podAnnotations                                | object | `{}`                                                                                                                                                                                                                               | Additional pod annotations                                     |
| resources                                     | object | `{}`                                                                                                                                                                                                                               | CPU/MEM resources                                              |
| securityContext                               | object | `{"privileged":true,"readOnlyRootFilesystem":true}`                                                                                                                                                                                | Privileges and access control settings for a container         |
| service.annotations                           | object | `{}`                                                                                                                                                                                                                               |                                                                |
| service.labels                                | object | `{}`                                                                                                                                                                                                                               |                                                                |
| service.port                                  | int    | `9435`                                                                                                                                                                                                                             |                                                                |
| service.portName                              | string | `"metrics"`                                                                                                                                                                                                                        |                                                                |
| service.type                                  | string | `"ClusterIP"`                                                                                                                                                                                                                      |                                                                |
| serviceMonitor.enabled                        | bool   | `true`                                                                                                                                                                                                                             |                                                                |
| serviceMonitor.interval                       | string | `"60s"`                                                                                                                                                                                                                            |                                                                |
| serviceMonitor.labels                         | object | `{}`                                                                                                                                                                                                                               |                                                                |
| serviceMonitor.relabelings[0].regex           | string | `"(.*)"`                                                                                                                                                                                                                           |                                                                |
| serviceMonitor.relabelings[0].replacement     | string | `"$1"`                                                                                                                                                                                                                             |                                                                |
| serviceMonitor.relabelings[0].sourceLabels[0] | string | `"__meta_kubernetes_pod_node_name"`                                                                                                                                                                                                |                                                                |
| serviceMonitor.relabelings[0].targetLabel     | string | `"hostname"`                                                                                                                                                                                                                       |                                                                |
| serviceMonitor.scrapeTimeout                  | string | `"10s"`                                                                                                                                                                                                                            |                                                                |
| tolerations                                   | list   | `[]`                                                                                                                                                                                                                               | Toleration for taints                                          |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
