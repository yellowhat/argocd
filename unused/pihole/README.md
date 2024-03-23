# pihole

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

![Version: 1.6.6](https://img.shields.io/badge/Version-1.6.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2023.05.1](https://img.shields.io/badge/AppVersion-2023.05.1-informational?style=flat-square)

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

pihole helm chart

**Homepage:** <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/pihole>

## Maintainers

| Name      | Email                   | Url |
|-----------|-------------------------|-----|
| yellowhat | <yellowhat@mailbox.org> |     |

## Source Code

* <https://pi-hole.net>
* <https://github.com/pi-hole>
* <https://github.com/pi-hole/docker-pi-hole>
* <https://github.com/MoJo2600/pihole-kubernetes/tree/master/charts/pihole>
* <https://gitlab.com/yellowhat-labs/mule/-/tree/main/charts/pihole>

<!-- markdownlint-capture -->
<!-- markdownlint-disable MD013 MD034 -->

## Values

| Key                                           | Type   | Default                                                | Description                                                                                       |
|-----------------------------------------------|--------|--------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| DNS1                                          | string | `"8.8.8.8"`                                            | Default upstream DNS 1 server to use                                                              |
| DNS2                                          | string | `"8.8.4.4"`                                            | Default upstream DNS 2 server to use                                                              |
| adlists                                       | object | `{}`                                                   | Adlists to import                                                                                 |
| admin                                         | object | `{"existingSecret":"","passwordKey":""}`               | Use an existing secret for the admin password                                                     |
| admin.existingSecret                          | string | `""`                                                   | Secret name                                                                                       |
| admin.passwordKey                             | string | `""`                                                   | Secret key                                                                                        |
| adminPassword                                 | string | `""`                                                   | Administrator password when not using an existing secret                                          |
| affinity                                      | object | `{}`                                                   | Affinity rules                                                                                    |
| antiaff.avoidRelease                          | string | `"pihole1"`                                            | pihole release to be avoided                                                                      |
| antiaff.enabled                               | bool   | `false`                                                | Enable antiaffinity (example: 2 pihole DNS in the same cluster)                                   |
| antiaff.strict                                | bool   | `true`                                                 | Preferred or required                                                                             |
| blacklist                                     | object | `{}`                                                   | Blacklisted domains to import                                                                     |
| dnsHostPort.enabled                           | bool   | `false`                                                |                                                                                                   |
| dnsHostPort.port                              | int    | `53`                                                   |                                                                                                   |
| dnscrypt.config                               | string | `""`                                                   |                                                                                                   |
| dnscrypt.enabled                              | bool   | `false`                                                | Deploy sidecar to use dnscrypt-proxy                                                              |
| dnscrypt.image.pullPolicy                     | string | `"IfNotPresent"`                                       |                                                                                                   |
| dnscrypt.image.repository                     | string | `"klutchell/dnscrypt-proxy"`                           |                                                                                                   |
| dnscrypt.image.tag                            | string | `"2.1.4"`                                              |                                                                                                   |
| dnscrypt.resources                            | object | `{}`                                                   |                                                                                                   |
| dnsmasq.additionalHostsEntries                | list   | `[]`                                                   | Dnsmasq reads the /etc/hosts file to resolve ips, you can add additional entries                  |
| dnsmasq.customCnameEntries                    | list   | `[]`                                                   | Custom CNAME  entries that should point to `A` records or elements in customDnsEntries array.     |
| dnsmasq.customDnsEntries                      | list   | `[]`                                                   | Add custom dns entries                                                                            |
| dnsmasq.customSettings                        | string | `nil`                                                  | Other options                                                                                     |
| dnsmasq.staticDhcpEntries                     | list   | `[]`                                                   | Static DHCP config                                                                                |
| dnsmasq.upstreamServers                       | list   | `[]`                                                   | Add upstream dns servers.                                                                         |
| doh.enabled                                   | bool   | `false`                                                | Enable DNS over HTTPs via cloudflared                                                             |
| doh.envVars                                   | object | `{}`                                                   | Extra environment variables to the DoH container                                                  |
| doh.name                                      | string | `"cloudflared"`                                        |                                                                                                   |
| doh.probes.liveness.enabled                   | bool   | `true`                                                 | Enable healthcheck for the doh container                                                          |
| doh.probes.liveness.failureThreshold          | int    | `10`                                                   |                                                                                                   |
| doh.probes.liveness.initialDelaySeconds       | int    | `60`                                                   |                                                                                                   |
| doh.probes.liveness.probe.exec.command[0]     | string | `"nslookup"`                                           |                                                                                                   |
| doh.probes.liveness.probe.exec.command[1]     | string | `"-po=5053"`                                           |                                                                                                   |
| doh.probes.liveness.probe.exec.command[2]     | string | `"cloudflare.com"`                                     |                                                                                                   |
| doh.probes.liveness.probe.exec.command[3]     | string | `"127.0.0.1"`                                          |                                                                                                   |
| doh.probes.liveness.timeoutSeconds            | int    | `5`                                                    |                                                                                                   |
| doh.pullPolicy                                | string | `"IfNotPresent"`                                       |                                                                                                   |
| doh.repository                                | string | `"crazymax/cloudflared"`                               |                                                                                                   |
| doh.tag                                       | string | `"latest"`                                             |                                                                                                   |
| dualStack.enabled                             | bool   | `false`                                                | Enable DualStack services or creation of separate IPv6 services if `serviceDns.type=LoadBalancer` |
| extraEnvVars                                  | object | `{}`                                                   | Extra environment variables                                                                       |
| extraEnvVarsSecret                            | object | `{}`                                                   | Extra environment variables from secrets                                                          |
| extraVolumeMounts                             | object | `{}`                                                   | Extra volume mount definition                                                                     |
| extraVolumes                                  | object | `{}`                                                   | Extra volume definition                                                                           |
| ftl                                           | object | `{}`                                                   | Values that should be added to pihole-FTL.conf                                                    |
| fullnameOverride                              | string | `""`                                                   | Replaces the generated name                                                                       |
| hostNetwork                                   | bool   | `false`                                                | Enable use host network                                                                           |
| hostname                                      | string | `""`                                                   | Pod hostname                                                                                      |
| image.pullPolicy                              | string | `"IfNotPresent"`                                       | Pull policy                                                                                       |
| image.repository                              | string | `"pihole/pihole"`                                      | Repository to pull the image from                                                                 |
| image.tag                                     | string | `""`                                                   | Image tag, if empty it will get it from the chart's appVersion                                    |
| imagePullSecrets                              | list   | `[]`                                                   | Secret name for pulling images from private repository                                            |
| ingress.annotations                           | object | `{}`                                                   |                                                                                                   |
| ingress.className                             | string | `""`                                                   |                                                                                                   |
| ingress.enabled                               | bool   | `false`                                                |                                                                                                   |
| ingress.hosts                                 | list   | `[]`                                                   |                                                                                                   |
| ingress.tls                                   | list   | `[]`                                                   |                                                                                                   |
| maxSurge                                      | int    | `1`                                                    | Maximum number of Pods that can be created over the desired number of Pods (RollingUpdate)        |
| maxUnavailable                                | int    | `0`                                                    | Maximum number of Pods that can be unavailable during the update process (RollingUpdate)          |
| monitoring.influxdb.enabled                   | bool   | `false`                                                | Push pihole logs to InfluxDB                                                                      |
| monitoring.influxdb.image.pullPolicy          | string | `"IfNotPresent"`                                       |                                                                                                   |
| monitoring.influxdb.image.repository          | string | `"registry.gitlab.com/yellowhat-labs/pihole2influxdb"` |                                                                                                   |
| monitoring.influxdb.image.tag                 | string | `"v1.2.11"`                                            |                                                                                                   |
| monitoring.influxdb.resources.limits.cpu      | string | `"250m"`                                               |                                                                                                   |
| monitoring.influxdb.resources.limits.memory   | string | `"64Mi"`                                               |                                                                                                   |
| monitoring.influxdb.resources.requests.cpu    | string | `"250m"`                                               |                                                                                                   |
| monitoring.influxdb.resources.requests.memory | string | `"64Mi"`                                               |                                                                                                   |
| monitoring.podMonitor.enabled                 | bool   | `false`                                                | Deploy PodMonitor custom resource                                                                 |
| monitoring.sidecar.enabled                    | bool   | `false`                                                | Deploy sidecar to make available metrics                                                          |
| monitoring.sidecar.image.pullPolicy           | string | `"IfNotPresent"`                                       |                                                                                                   |
| monitoring.sidecar.image.repository           | string | `"ekofr/pihole-exporter"`                              |                                                                                                   |
| monitoring.sidecar.image.tag                  | string | `"v0.4.0"`                                             |                                                                                                   |
| monitoring.sidecar.port                       | int    | `9617`                                                 |                                                                                                   |
| monitoring.sidecar.resources.limits.cpu       | string | `"50m"`                                                |                                                                                                   |
| monitoring.sidecar.resources.limits.memory    | string | `"64Mi"`                                               |                                                                                                   |
| monitoring.sidecar.resources.requests.cpu     | string | `"50m"`                                                |                                                                                                   |
| monitoring.sidecar.resources.requests.memory  | string | `"64Mi"`                                               |                                                                                                   |
| nameOverride                                  | string | `""`                                                   | Replaces the name of the chart in the Chart.yaml file                                             |
| nodeSelector                                  | object | `{}`                                                   | Node selection constraint                                                                         |
| persistence.accessModes                       | list   | `["ReadWriteOnce"]`                                    | Reuse an existing claim existingClaim: your-claim subPath: some-subpath                           |
| persistence.annotations                       | object | `{}`                                                   |                                                                                                   |
| persistence.enabled                           | bool   | `false`                                                | Enable persistence                                                                                |
| persistence.size                              | string | `"500Mi"`                                              |                                                                                                   |
| podAnnotations                                | object | `{}`                                                   | Additional pod annotations                                                                        |
| podDnsConfig.enabled                          | bool   | `true`                                                 | Enable custom Pod DNS configuration                                                               |
| podDnsConfig.nameservers                      | list   | `["127.0.0.1","8.8.8.8"]`                              | Pod's DNS nameserver                                                                              |
| podDnsConfig.policy                           | string | `"None"`                                               | Pod's DNS policy, `None`: ignore DNS settings from Kubernetes environment                         |
| podSecurityContext                            | object | `{}`                                                   | Privileges and access control settings for a Pod (all containers in a pod)                        |
| privileged                                    | bool   | `false`                                                | Enable privileged mode                                                                            |
| probes.liveness.enabled                       | bool   | `true`                                                 | Enable healthcheck for the deployment                                                             |
| probes.liveness.failureThreshold              | int    | `10`                                                   |                                                                                                   |
| probes.liveness.initialDelaySeconds           | int    | `60`                                                   |                                                                                                   |
| probes.liveness.port                          | string | `"http"`                                               |                                                                                                   |
| probes.liveness.scheme                        | string | `"HTTP"`                                               |                                                                                                   |
| probes.liveness.timeoutSeconds                | int    | `5`                                                    |                                                                                                   |
| probes.readiness.enabled                      | bool   | `true`                                                 | Enable readiness probe for the deployment                                                         |
| probes.readiness.failureThreshold             | int    | `3`                                                    |                                                                                                   |
| probes.readiness.initialDelaySeconds          | int    | `60`                                                   |                                                                                                   |
| probes.readiness.port                         | string | `"http"`                                               |                                                                                                   |
| probes.readiness.scheme                       | string | `"HTTP"`                                               |                                                                                                   |
| probes.readiness.timeoutSeconds               | int    | `5`                                                    |                                                                                                   |
| regex                                         | object | `{}`                                                   | Blacklisted regex expressions to import                                                           |
| replicaCount                                  | int    | `1`                                                    | Number of replicas                                                                                |
| resources                                     | object | `{}`                                                   | CPU/MEM resources                                                                                 |
| securityContext                               | object | `{}`                                                   | Privileges and access control settings for a container                                            |
| serviceDhcp.annotations                       | object | `{}`                                                   |                                                                                                   |
| serviceDhcp.enabled                           | bool   | `true`                                                 |                                                                                                   |
| serviceDhcp.externalTrafficPolicy             | string | `"Local"`                                              |                                                                                                   |
| serviceDhcp.nodePort                          | string | `""`                                                   |                                                                                                   |
| serviceDhcp.port                              | int    | `67`                                                   |                                                                                                   |
| serviceDhcp.type                              | string | `"ClusterIP"`                                          |                                                                                                   |
| serviceDns.annotations                        | object | `{}`                                                   |                                                                                                   |
| serviceDns.externalTrafficPolicy              | string | `"Local"`                                              |                                                                                                   |
| serviceDns.mixedService                       | bool   | `false`                                                | Deploys a mixed (TCP + UDP) Service instead of separate ones                                      |
| serviceDns.nodePort                           | string | `""`                                                   |                                                                                                   |
| serviceDns.port                               | int    | `53`                                                   |                                                                                                   |
| serviceDns.type                               | string | `"ClusterIP"`                                          |                                                                                                   |
| serviceWeb.annotations                        | object | `{}`                                                   |                                                                                                   |
| serviceWeb.externalTrafficPolicy              | string | `"Local"`                                              |                                                                                                   |
| serviceWeb.http.enabled                       | bool   | `true`                                                 |                                                                                                   |
| serviceWeb.http.nodePort                      | string | `""`                                                   |                                                                                                   |
| serviceWeb.http.port                          | int    | `80`                                                   |                                                                                                   |
| serviceWeb.https.enabled                      | bool   | `true`                                                 |                                                                                                   |
| serviceWeb.https.nodePort                     | string | `""`                                                   |                                                                                                   |
| serviceWeb.https.port                         | int    | `443`                                                  |                                                                                                   |
| serviceWeb.type                               | string | `"ClusterIP"`                                          |                                                                                                   |
| strategyType                                  | string | `"RollingUpdate"`                                      | Deployment strategy                                                                               |
| tolerations                                   | list   | `[]`                                                   | Toleration for taints                                                                             |
| topologySpreadConstraints                     | list   | `[]`                                                   | Control pod placement                                                                             |
| virtualHost                                   | string | `"pi.hole"`                                            | Pi-Hole CNAME                                                                                     |
| webHttp                                       | string | `"80"`                                                 | Container port for HTTP traffic                                                                   |
| webHttps                                      | string | `"443"`                                                | Container port for HTTPS traffic                                                                  |
| whitelist                                     | object | `{}`                                                   | Whitelisted domains to import                                                                     |

<!-- markdownlint-enable MD013 MD034 -->
<!-- markdownlint-restore -->

## Configuring Upstream DNS Resolvers

By default, it will configure pod DNS automatically to use Google's `8.8.8.8` nameserver
for upstream DNS resolution.
You can configure this, or opt-out of pod DNS configuration completely.

For example, to use Cloudflare's resolver:

```yaml
podDnsConfig:
  enabled: true
  policy: "None"
  nameservers:
  - 127.0.0.1
  - 1.1.1.1
```

If you have other DNS policy at play (for example, when running a service mesh),
you may not want to have `pihole-kubernetes` control this behavior.
In that case, you can disable DNS configuration on `pihole` pods:

```yaml
podDnsConfig:
  enabled: false
```

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
