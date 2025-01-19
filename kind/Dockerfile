FROM quay.io/podman/stable:v5.2.2

ENV KIND_EXPERIMENTAL_PROVIDER podman

RUN dnf install -y ansible-core \
 && dnf clean all

# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VER=v4.44.3
RUN curl \
        --location \
        --output /usr/local/bin/yq \
        "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_linux_amd64" \
 && chmod +x /usr/local/bin/yq

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VER=v1.31.0
RUN curl \
        --location \
        --output kubectl \
        --remote-name \
        "https://dl.k8s.io/release/${KUBECTL_VER}/bin/linux/amd64/kubectl" \
 && install --owner root --group root --mode 0755 kubectl /usr/local/bin/kubectl \
 && kubectl version --client \
 && rm -rf kubectl

# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VER=v3.15.4
RUN curl \
        --location \
        "https://get.helm.sh/helm-${HELM_VER}-linux-amd64.tar.gz" \
            | tar xz --no-same-owner --directory /usr/local/bin/ --strip-components 1 \
 && helm version

# renovate: datasource=github-releases depName=derailed/k9s
ARG K9S_VER=v0.32.5
RUN curl \
        --location \
        "https://github.com/derailed/k9s/releases/download/${K9S_VER}/k9s_Linux_amd64.tar.gz" \
            | tar xz --no-same-owner --directory /usr/local/bin/ \
 && k9s version

# renovate: datasource=github-releases depName=kubernetes-sigs/kind
ARG KIND_VER=v0.24.0
RUN curl \
        --location \
        --output kind \
        "https://kind.sigs.k8s.io/dl/${KIND_VER}/kind-$(uname)-amd64" \
 && install --owner root --group root --mode 0755 kind /usr/local/bin/kind \
 && kind --version \
 && rm -rf kind

# renovate: datasource=github-releases depName=argoproj/argo-cd
ARG ARGOCD_VER=v2.12.0
RUN curl \
        --location \
        --output argocd \
        "https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VER}/argocd-linux-amd64" \
 && install --owner root --group root --mode 0755 argocd /usr/local/bin/argocd \
 && argocd version --client \
 && rm -rf argocd

RUN sed -i /etc/containers/containers.conf \
    # Fix: `cannot set hostname when running in the host UTS namespace`
    -e 's|utsns=.*|utsns="private"|' \
    # Fix: `ERROR: UserNS: cpu controller needs to be delegated`
    -e 's|cgroups=.*|cgroups="enabled"|'

# renovate: datasource=docker depName=kindest/node
ENV NODE_VER=v1.31.0
# Pretent to create a cluster to cache the node container image
RUN kind create cluster --image "kindest/node:$NODE_VER" || true

COPY kind-config.yaml /opt/kind-config.yaml
COPY kind-bootstrap.sh /usr/local/bin/kind-bootstrap

ENTRYPOINT ["/usr/local/bin/kind-bootstrap"]
