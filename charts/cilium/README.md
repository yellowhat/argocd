# cilium

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

Install cilium

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/cilium>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://cilium.io>
* <https://github.com/cilium/cilium/tree/master/install/kubernetes/cilium>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/cilium>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Requirements

| Repository             | Name   | Version |
|------------------------|--------|---------|
| https://helm.cilium.io | cilium | 1.16.0  |

## Values

| Key                                                                   | Type   | Default                                                                                                                                                        | Description |
|-----------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| cilium.dashboards.annotations.grafana_dashboard_folder                | string | `"Cilium"`                                                                                                                                                     |             |
| cilium.dashboards.enabled                                             | bool   | `true`                                                                                                                                                         |             |
| cilium.dashboards.label                                               | string | `"grafana_dashboard"`                                                                                                                                          |             |
| cilium.hubble.enabled                                                 | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.metrics.dashboards.annotations.grafana_dashboard_folder | string | `"Cilium"`                                                                                                                                                     |             |
| cilium.hubble.metrics.dashboards.enabled                              | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.metrics.dashboards.label                                | string | `"grafana_dashboard"`                                                                                                                                          |             |
| cilium.hubble.metrics.enabled[0]                                      | string | `"dns"`                                                                                                                                                        |             |
| cilium.hubble.metrics.enabled[1]                                      | string | `"drop"`                                                                                                                                                       |             |
| cilium.hubble.metrics.enabled[2]                                      | string | `"flow"`                                                                                                                                                       |             |
| cilium.hubble.metrics.enabled[3]                                      | string | `"httpV2:exemplars=true;labelsContext=source_ip,source_namespace,source_workload,destination_ip,destination_namespace,destination_workload,traffic_direction"` |             |
| cilium.hubble.metrics.enabled[4]                                      | string | `"icmp"`                                                                                                                                                       |             |
| cilium.hubble.metrics.enabled[5]                                      | string | `"port-distribution"`                                                                                                                                          |             |
| cilium.hubble.metrics.enabled[6]                                      | string | `"tcp"`                                                                                                                                                        |             |
| cilium.hubble.metrics.serviceMonitor.enabled                          | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.relay.enabled                                           | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.relay.prometheus.enabled                                | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.relay.prometheus.serviceMonitor.enabled                 | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.relay.rollOutPods                                       | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.tls.enabled                                             | bool   | `false`                                                                                                                                                        |             |
| cilium.hubble.ui.enabled                                              | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.ui.ingress.annotations."kubernetes.io/tls-acme"         | string | `"true"`                                                                                                                                                       |             |
| cilium.hubble.ui.ingress.className                                    | string | `"cilium"`                                                                                                                                                     |             |
| cilium.hubble.ui.ingress.enabled                                      | bool   | `true`                                                                                                                                                         |             |
| cilium.hubble.ui.ingress.hosts[0]                                     | string | `"hubble.mukka.haus"`                                                                                                                                          |             |
| cilium.hubble.ui.ingress.tls[0].hosts[0]                              | string | `"hubble.mukka.haus"`                                                                                                                                          |             |
| cilium.hubble.ui.ingress.tls[0].secretName                            | string | `"hubble-tls"`                                                                                                                                                 |             |
| cilium.hubble.ui.rollOutPods                                          | bool   | `true`                                                                                                                                                         |             |
| cilium.ingressController.enabled                                      | bool   | `true`                                                                                                                                                         |             |
| cilium.ingressController.enforceHttps                                 | bool   | `true`                                                                                                                                                         |             |
| cilium.ingressController.loadbalancerMode                             | string | `"dedicated"`                                                                                                                                                  |             |
| cilium.k8sServiceHost                                                 | string | `"mule"`                                                                                                                                                       |             |
| cilium.k8sServicePort                                                 | int    | `6443`                                                                                                                                                         |             |
| cilium.kubeProxyReplacement                                           | bool   | `true`                                                                                                                                                         |             |
| cilium.l2announcements.enabled                                        | bool   | `true`                                                                                                                                                         |             |
| cilium.operator.dashboards.annotations.grafana_dashboard_folder       | string | `"Cilium"`                                                                                                                                                     |             |
| cilium.operator.dashboards.enabled                                    | bool   | `true`                                                                                                                                                         |             |
| cilium.operator.dashboards.label                                      | string | `"grafana_dashboard"`                                                                                                                                          |             |
| cilium.operator.enabled                                               | bool   | `true`                                                                                                                                                         |             |
| cilium.operator.prometheus.enabled                                    | bool   | `true`                                                                                                                                                         |             |
| cilium.operator.prometheus.serviceMonitor.enabled                     | bool   | `true`                                                                                                                                                         |             |
| cilium.operator.prometheus.serviceMonitor.interval                    | string | `"30s"`                                                                                                                                                        |             |
| cilium.operator.replicas                                              | int    | `1`                                                                                                                                                            |             |
| cilium.operator.rollOutPods                                           | bool   | `true`                                                                                                                                                         |             |
| cilium.prometheus.enabled                                             | bool   | `true`                                                                                                                                                         |             |
| cilium.prometheus.serviceMonitor.enabled                              | bool   | `true`                                                                                                                                                         |             |
| cilium.prometheus.serviceMonitor.interval                             | string | `"30s"`                                                                                                                                                        |             |
| cilium.rollOutCiliumPods                                              | bool   | `true`                                                                                                                                                         |             |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
