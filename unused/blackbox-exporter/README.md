# blackbox-exporter

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.2.7](https://img.shields.io/badge/Version-1.2.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 9.0.0](https://img.shields.io/badge/AppVersion-9.0.0-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

blackbox exporter helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/blackbox>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://github.com/prometheus/blackbox_exporter>
* <https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-blackbox-exporter>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/blackbox>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Requirements

| Repository                                         | Name                         | Version |
|----------------------------------------------------|------------------------------|---------|
| https://prometheus-community.github.io/helm-charts | prometheus-blackbox-exporter | 9.0.0   |

## Values

| Key                                                                          | Type   | Default                              | Description |
|------------------------------------------------------------------------------|--------|--------------------------------------|-------------|
| prometheus-blackbox-exporter.config.modules.http.http.fail_if_not_ssl        | bool   | `false`                              |             |
| prometheus-blackbox-exporter.config.modules.http.http.fail_if_ssl            | bool   | `false`                              |             |
| prometheus-blackbox-exporter.config.modules.http.http.follow_redirects       | bool   | `true`                               |             |
| prometheus-blackbox-exporter.config.modules.http.http.method                 | string | `"GET"`                              |             |
| prometheus-blackbox-exporter.config.modules.http.http.preferred_ip_protocol  | string | `"ip4"`                              |             |
| prometheus-blackbox-exporter.config.modules.http.http.valid_http_versions[0] | string | `"HTTP/1.1"`                         |             |
| prometheus-blackbox-exporter.config.modules.http.http.valid_http_versions[1] | string | `"HTTP/2.0"`                         |             |
| prometheus-blackbox-exporter.config.modules.http.prober                      | string | `"http"`                             |             |
| prometheus-blackbox-exporter.config.modules.http.timeout                     | string | `"5s"`                               |             |
| prometheus-blackbox-exporter.image.pullPolicy                                | string | `"Always"`                           |             |
| prometheus-blackbox-exporter.serviceMonitor.defaults.interval                | string | `"120s"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.defaults.scrapeTimeout           | string | `"10s"`                              |             |
| prometheus-blackbox-exporter.serviceMonitor.enabled                          | bool   | `true`                               |             |
| prometheus-blackbox-exporter.serviceMonitor.selfMonitor.enabled              | bool   | `true`                               |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[0].module                | string | `"http"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[0].name                  | string | `"gitlab"`                           |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[0].url                   | string | `"https://gitlab.com"`               |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[1].module                | string | `"http"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[1].name                  | string | `"github"`                           |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[1].url                   | string | `"https://github.com"`               |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[2].module                | string | `"http"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[2].name                  | string | `"google"`                           |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[2].url                   | string | `"https://google.com"`               |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[3].module                | string | `"http"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[3].name                  | string | `"grafana"`                          |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[3].url                   | string | `"https://grafana.mukka.haus/login"` |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[4].module                | string | `"http"`                             |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[4].name                  | string | `"jellyfin"`                         |             |
| prometheus-blackbox-exporter.serviceMonitor.targets[4].url                   | string | `"https://jellyfin.mukka.haus"`      |             |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
