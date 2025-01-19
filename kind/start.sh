#!/usr/bin/env bash
# Start kind cluster
set -xeuo pipefail

args=(
    # Required to fake-bootstrap kind to preload the node image
    --cap-add SYS_ADMIN
    --tag kind:local
)
# sudo is required for cilium, permission denied on /sys/fs/bpf
sudo podman build "${args[@]}" "$(dirname "$0")"

args=(
    --name kind
    --hostname kind
    --interactive
    --tty
    --rm
    --privileged
    --publish 8080:8080
    --publish 30080:30080
    --volume "${PWD}:/data"
    --workdir /data
    --security-opt label=disable
)
# sudo is required for cilium, permission denied on /sys/fs/bpf
sudo podman run "${args[@]}" kind:local
