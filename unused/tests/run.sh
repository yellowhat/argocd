#!/usr/bin/env bash
# Run test
set -euo pipefail

TARGET_IP="192.168.0.57"

podman run \
    --interactive \
    --tty \
    --rm \
    --add-host "mule:${TARGET_IP}" \
    --env KUBECONFIG=/kubeconfig \
    --env TARGET_IP="$TARGET_IP" \
    --pull newer \
    registry.gitlab.com/yellowhat-labs/mule:main sh -c '''
git clone https://gitlab.com/yellowhat-labs/mule --depth 1
cd mule

scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "k8s@${TARGET_IP}:./.kube/config" /kubeconfig

pytest --capture=no tests/
'''
