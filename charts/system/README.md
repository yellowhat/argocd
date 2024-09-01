# system

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 4.8.46](https://img.shields.io/badge/Version-4.8.46-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.8.46](https://img.shields.io/badge/AppVersion-4.8.46-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

Install system

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/system>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://github.com/bitnami-labs/sealed-secrets>
* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>
* <https://github.com/grafana/loki/tree/main/production/helm/loki>
* <https://github.com/grafana/helm-charts/tree/main/charts/promtail>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/system>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Requirements

| Repository                                         | Name                  | Version |
|----------------------------------------------------|-----------------------|---------|
| https://bitnami-labs.github.io/sealed-secrets      | sealed-secrets        | 2.16.1  |
| https://grafana.github.io/helm-charts              | loki                  | 6.10.0  |
| https://grafana.github.io/helm-charts              | promtail              | 6.16.4  |
| https://prometheus-community.github.io/helm-charts | kube-prometheus-stack | 61.9.0  |

## Values

| Key                                                                                                             | Type   | Default                                                 | Description |
|-----------------------------------------------------------------------------------------------------------------|--------|---------------------------------------------------------|-------------|
| kube-prometheus-stack.alertmanager.enabled                                                                      | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana."grafana.ini"."auth.anonymous".enabled                                            | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana."grafana.ini"."auth.anonymous".org_role                                           | string | `"Admin"`                                               |             |
| kube-prometheus-stack.grafana."grafana.ini".analytics.check_for_plugin_updates                                  | bool   | `false`                                                 |             |
| kube-prometheus-stack.grafana."grafana.ini".analytics.check_for_updates                                         | bool   | `false`                                                 |             |
| kube-prometheus-stack.grafana."grafana.ini".analytics.reporting_enabled                                         | bool   | `false`                                                 |             |
| kube-prometheus-stack.grafana."grafana.ini".panels.disable_sanitize_html                                        | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].jsonData.timeout                                         | int    | `600`                                                   |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].name                                                     | string | `"loki"`                                                |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].orgId                                                    | int    | `1`                                                     |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].type                                                     | string | `"loki"`                                                |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].url                                                      | string | `"http://system-loki:3100"`                             |             |
| kube-prometheus-stack.grafana.additionalDataSources[0].version                                                  | int    | `1`                                                     |             |
| kube-prometheus-stack.grafana.ingress.annotations."kubernetes.io/tls-acme"                                      | string | `"true"`                                                |             |
| kube-prometheus-stack.grafana.ingress.enabled                                                                   | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana.ingress.hosts[0]                                                                  | string | `"grafana.mukka.haus"`                                  |             |
| kube-prometheus-stack.grafana.ingress.ingressClassName                                                          | string | `"cilium"`                                              |             |
| kube-prometheus-stack.grafana.ingress.tls[0].hosts[0]                                                           | string | `"grafana.mukka.haus"`                                  |             |
| kube-prometheus-stack.grafana.ingress.tls[0].secretName                                                         | string | `"grafana-tls"`                                         |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.enabled                                                        | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.folderAnnotation                                               | string | `"grafana_dashboard_folder"`                            |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.label                                                          | string | `"grafana_dashboard"`                                   |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.logLevel                                                       | string | `"WARN"`                                                |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.provider.foldersFromFilesStructure                             | bool   | `true`                                                  |             |
| kube-prometheus-stack.grafana.sidecar.dashboards.searchNamespace                                                | string | `"ALL"`                                                 |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].job_name                             | string | `"tasmota"`                                             |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].metrics_path                         | string | `"/metrics"`                                            |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[0]         | string | `"192.168.0.100"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[1]         | string | `"192.168.0.101"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[2]         | string | `"192.168.0.102"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[3]         | string | `"192.168.0.103"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[4]         | string | `"192.168.0.104"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.additionalScrapeConfigs[0].static_configs[0].targets[5]         | string | `"192.168.0.105"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.retention                                                       | string | `"1y"`                                                  |             |
| kube-prometheus-stack.prometheus.prometheusSpec.retentionSize                                                   | string | `"50GB"`                                                |             |
| kube-prometheus-stack.prometheus.prometheusSpec.ruleSelectorNilUsesHelmValues                                   | bool   | `false`                                                 |             |
| kube-prometheus-stack.prometheus.prometheusSpec.securityContext.fsGroup                                         | int    | `2000`                                                  |             |
| kube-prometheus-stack.prometheus.prometheusSpec.securityContext.fsGroupChangePolicy                             | string | `"OnRootMismatch"`                                      |             |
| kube-prometheus-stack.prometheus.prometheusSpec.securityContext.runAsGroup                                      | int    | `2000`                                                  |             |
| kube-prometheus-stack.prometheus.prometheusSpec.securityContext.runAsNonRoot                                    | bool   | `true`                                                  |             |
| kube-prometheus-stack.prometheus.prometheusSpec.securityContext.runAsUser                                       | int    | `1000`                                                  |             |
| kube-prometheus-stack.prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues                         | bool   | `false`                                                 |             |
| kube-prometheus-stack.prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.accessModes[0]             | string | `"ReadWriteOnce"`                                       |             |
| kube-prometheus-stack.prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage | string | `"100Gi"`                                               |             |
| kube-prometheus-stack.prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.storageClassName           | string | `"prometheus"`                                          |             |
| loki.backend.replicas                                                                                           | int    | `0`                                                     |             |
| loki.bloomCompactor.replicas                                                                                    | int    | `0`                                                     |             |
| loki.bloomGateway.replicas                                                                                      | int    | `0`                                                     |             |
| loki.chunksCache.enabled                                                                                        | bool   | `false`                                                 |             |
| loki.compactor.replicas                                                                                         | int    | `0`                                                     |             |
| loki.deploymentMode                                                                                             | string | `"SingleBinary"`                                        |             |
| loki.distributor.replicas                                                                                       | int    | `0`                                                     |             |
| loki.gateway.enabled                                                                                            | bool   | `false`                                                 |             |
| loki.indexGateway.replicas                                                                                      | int    | `0`                                                     |             |
| loki.ingester.replicas                                                                                          | int    | `0`                                                     |             |
| loki.loki.analytics.reporting_enabled                                                                           | bool   | `false`                                                 |             |
| loki.loki.auth_enabled                                                                                          | bool   | `false`                                                 |             |
| loki.loki.commonConfig.replication_factor                                                                       | int    | `1`                                                     |             |
| loki.loki.limits_config.max_query_parallelism                                                                   | int    | `4`                                                     |             |
| loki.loki.limits_config.max_query_series                                                                        | int    | `10000`                                                 |             |
| loki.loki.limits_config.retention_period                                                                        | string | `"7d"`                                                  |             |
| loki.loki.rulerConfig.alertmanager_url                                                                          | string | `"http://system-kube-prometheus-sta-alertmanager:9093"` |             |
| loki.loki.schemaConfig.configs[0].from                                                                          | string | `"2024-04-01"`                                          |             |
| loki.loki.schemaConfig.configs[0].index.period                                                                  | string | `"24h"`                                                 |             |
| loki.loki.schemaConfig.configs[0].index.prefix                                                                  | string | `"loki_index_"`                                         |             |
| loki.loki.schemaConfig.configs[0].object_store                                                                  | string | `"filesystem"`                                          |             |
| loki.loki.schemaConfig.configs[0].schema                                                                        | string | `"v13"`                                                 |             |
| loki.loki.schemaConfig.configs[0].store                                                                         | string | `"tsdb"`                                                |             |
| loki.loki.server.log_level                                                                                      | string | `"warn"`                                                |             |
| loki.loki.storage.type                                                                                          | string | `"filesystem"`                                          |             |
| loki.querier.replicas                                                                                           | int    | `0`                                                     |             |
| loki.queryFrontend.replicas                                                                                     | int    | `0`                                                     |             |
| loki.queryScheduler.replicas                                                                                    | int    | `0`                                                     |             |
| loki.read.replicas                                                                                              | int    | `0`                                                     |             |
| loki.resultsCache.enabled                                                                                       | bool   | `false`                                                 |             |
| loki.singleBinary.persistence.size                                                                              | string | `"20Gi"`                                                |             |
| loki.singleBinary.persistence.storageClass                                                                      | string | `"loki"`                                                |             |
| loki.singleBinary.replicas                                                                                      | int    | `1`                                                     |             |
| loki.write.replicas                                                                                             | int    | `0`                                                     |             |
| promtail.annotations."datree.skip/CONTAINERS_INCORRECT_PRIVILEGED_VALUE_TRUE"                                   | string | `"required for SELinux"`                                |             |
| promtail.config.clients[0].url                                                                                  | string | `"http://system-loki:3100/loki/api/v1/push"`            |             |
| promtail.config.logLevel                                                                                        | string | `"warn"`                                                |             |
| promtail.containerSecurityContext.allowPrivilegeEscalation                                                      | bool   | `true`                                                  |             |
| promtail.containerSecurityContext.privileged                                                                    | bool   | `true`                                                  |             |
| sealed-secrets.keyrenewperiod                                                                                   | string | `"0"`                                                   |             |
| sealed-secrets.resources.limits.memory                                                                          | string | `"256Mi"`                                               |             |
| sealed-secrets.resources.requests.cpu                                                                           | string | `"150m"`                                                |             |
| sealed-secrets.resources.requests.memory                                                                        | string | `"256Mi"`                                               |             |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
