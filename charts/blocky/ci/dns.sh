#!/usr/bin/env bash
# Test if hostnames are blocked or not
set -euo pipefail

domains_blocked=(
    "tvx.adgrx.com"
    "d1oxlq5h9kq8q5.cloudfront.net"
    "samsungtifa.com"
    "ad.doubleclick.net"
    "static.doubleclick.net"
    "www.facebook.com"
    "googleads.g.doubleclick.net"
    "www.googleadservices.com"
    "ade.googlesyndication.com"
    "pagead2.googlesyndication.com"
    "tpc.googlesyndication.com"
    "eligibility-panelresearch.googlevideo.com"
    "www.msn.com"
    "nrdp.nccp.netflix.com"
    "customerevents.netflix.com"
    "ichnaea.netflix.com"
    "secureclock.playready.microsoft.com"
    "gld.push.samsungosp.com"
    "config.samsungads.com"
    "cdn.samsungcloudsolution.com"
    "empdownprd.samsungcloudsolution.com"
    "notice.samsungcloudsolution.com"
    "oempprd.samsungcloudsolution.com"
    "sas.samsungcloudsolution.com"
    "configprd.samsungcloudsolution.net"
    "lcprd1.samsungcloudsolution.net"
    "otnprd10.samsungcloudsolution.net"
    "otnprd11.samsungcloudsolution.net"
    "otnprd8.samsungcloudsolution.net"
    "otnprd9.samsungcloudsolution.net"
    "time.samsungcloudsolution.com"
    "time.samsungcloudsolution.net"
    "musicid.samsungcloud.tv"
    "apu.samsungelectronics.com"
    "bpu.samsungelectronics.com"
    "cpu.samsungelectronics.com"
    "dpu.samsungelectronics.com"
    "kpu.samsungelectronics.com"
    "upu.samsungelectronics.com"
    "xpu.samsungelectronics.com"
    "ypu.samsungelectronics.com"
    "zpu.samsungelectronics.com"
    "img-resize-cdn-prod.samsungnyc.com"
    "www.samsungotn.net"
    "gpm.samsungqbe.com"
    "osb-apps.samsungqbe.com"
    "osb-auth-eusvc.samsungqbe.com"
    "osb-tnc-v2-appsacc.samsungqbe.com"
    "osb-v1-alb.samsungqbe.com"
    "osb-v1-eusvc.samsungqbe.com"
    "osb-v1.samsungqbe.com"
    "config.sbixby.com"
    "crl.tivuon.tv"
    "selfsigned.ueiwsp.com"
)

domains_allow=(
    # TV Specific
    "occ-0-4419-1555.1.nflxso.net"
    "ipv4-c134-fra002-ix.1.oca.nflxvideo.net"
    "www.amazon.com"
    "mediaservices.cdn-apple.com"
    "edition.cnn.com"
    "clients1.google.com"
    "play.google.com"
    "www.google.com"
    "redirector.googlevideo.com"
    "t1.gstatic.com"
    "t2.gstatic.com"
    "t3.gstatic.com"
    "www.gstatic.com"
    "www.imdb.com"
    "go.microsoft.com"
    "api-global.netflix.com"
    "nrdp50-appboot.netflix.com"
    "nrdp51-appboot.netflix.com"
    "secure.netflix.com"
    "uiboot.netflix.com"
    "cdn-0.nflximg.com"
    "crl.pki.goog"
    "ocsp.pki.goog"
    "nrdp.prod.cloud.netflix.com"
    "nrdp-cell4.prod.ftl.netflix.com"
    "nrdp-ipv4.prod.ftl.netflix.com"
    "push.prod.netflix.com"
    "preapp.prod.partner.netflix.net"
    "www.vimeo.com"
    "www.yahoo.com"
    "www.youtube.com"
    "i2.ytimg.com"
    "i3.ytimg.com"
    "i.ytimg.com"
    # Other
    "nid.naver.com"
    "mail.naver.com"
    "i.instagram.com"
    "pinterest.com"
    "www.pinterest.com"
    "pinterest.co.kr"
    "www.pinterest.co.kr"
    "api.pinterest.com"
    "i.pinimg.com"
    "s.pinimg.com"
    "login.microsoftonline.com"
)

echo "[FIRST REQUEST]"
dig +retry=10 "@${SERVER}" google.com
echo ""

echo "[BLOCKED]"
for domain in "${domains_blocked[@]}"; do
    ip=$(dig +short "@${SERVER}" "$domain")
    if [[ "$ip" == "0.0.0.0" ]]; then
        echo "blocked: $domain"
    else
        echo "not blocked: $domain"
        exit 1
    fi
done
echo ""

echo "[NOT BLOCKED]"
for domain in "${domains_allow[@]}"; do
    ip=$(dig +short "@${SERVER}" "$domain")
    if [[ "$ip" == "0.0.0.0" ]]; then
        echo "blocked: $domain"
        exit 1
    else
        echo "not blocked: $domain"
    fi
done
