#!/usr/bin/env bash
set -euo pipefail

cat >/tmp/values.yaml <<EOF
adminPassword: "pihole"  # pragma: allowlist secret

DNS1: "9.9.9.9"
DNS2: "149.112.112.112"

podDnsConfig:
  enabled: true
  policy: "None"
  nameservers:
    - 9.9.9.9
    - 149.112.112.112

dnsmasq:
  customDnsEntries:
    - address=/pihole.lan/192.168.178.200
  customCnameEntries:
    - cname=pihole.lan,pihole.192.168.178.200.nip.io

adlists:
  - https://adaway.org/hosts.txt
  - https://gist.githubusercontent.com/wassname/b594c63222f9e4c83ea23c818440901b/raw/1b0afd2aecf3a099f1681b1cf18fc0e6e2fa116a/Samsung%2520Smart-TV%2520Blocklist%2520Adlist%2520(for%2520PiHole)
  - https://gitlab.com/Kurobeats/phishing_hosts/raw/master/hosts
  - https://perflyst.github.io/PiHoleBlocklist/SmartTV.txt
  - https://raw.githubusercontent.com/MetaMask/eth-phishing-detect/master/src/hosts.txt
  - https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts
  - https://raw.githubusercontent.com/blocklistproject/Lists/master/ads.txt
  - https://raw.githubusercontent.com/blocklistproject/Lists/master/basic.txt
  - https://raw.githubusercontent.com/blocklistproject/Lists/master/malware.txt
  - https://raw.githubusercontent.com/blocklistproject/Lists/master/phishing.txt
  - https://raw.githubusercontent.com/blocklistproject/Lists/master/ransomware.txt
  - https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/CryptoWall-Ransomware-C2-Domain-blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/Locky-Ransomware-C2-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/Ransomware-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/TeslaCrypt-Ransomware-C2-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/TeslaCrypt-Ransomware-Payment-Sites-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/TorrentLocker-Ransomware-C2-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/TorrentLocker-Ransomware-Payment-Sites-Domain-Blocklist.txt
  - https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/WindowsSpyBlocker81.txt
  - https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/crowed_list.txt
  - https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/youtubelist.txt
  - https://raw.githubusercontent.com/pirat28/IHateTracker/master/iHateTracker.txt
  - https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardMobileSpyware.txt
  - https://reddestdream.github.io/Projects/MinimalHosts/etc/MinimalHostsBlocker/minimalhosts
  - https://v.firebog.net/hosts/AdguardDNS.txt
  - https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext
  - https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts
  - https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt
  - https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts
  - https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
  - https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
  - https://v.firebog.net/hosts/Admiral.txt
  - https://v.firebog.net/hosts/Easylist.txt

extraEnvVars: {
  DNSMASQ_USER: "root"
}

resources:
  limits:
    cpu: 200m
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 128Mi

serviceWeb:
  annotations:
    metallb.universe.tf/allow-shared-ip: pihole-svc
  type: LoadBalancer
  loadBalancerIP: 192.168.178.200

serviceDns:
  annotations:
    metallb.universe.tf/allow-shared-ip: pihole-svc
  type: LoadBalancer
  loadBalancerIP: 192.168.178.200

serviceDhcp:
  enabled: false
EOF

helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes
helm upgrade pihole mojo2600/pihole \
    --install \
    --version 2.9.3 \
    --namespace pihole \
    --create-namespace \
    --values /tmp/values.yaml \
    --wait
