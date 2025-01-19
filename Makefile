MAKEFLAGS     += --no-print-directory
MKFILE_DIR    := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
.DEFAULT_GOAL := help
# renovate: datasource=docker depName=docker.io/alpine/helm
HELM_VER       = 3.15.3

.PHONY: manifests
manifests: ## Create k8s manifests
	./scripts/gen_manifests.sh

.PHONY: podman-manifests
podman-manifests: ## Create k8s manifests using container
	podman run \
		--interactive \
		--tty \
		--rm \
		--volume "${PWD}:/data" \
		--workdir /data \
		--security-opt label=disable \
		--entrypoint ash \
		"docker.io/alpine/helm:${HELM_VER}" -c './scripts/gen_manifests.sh'

.PHONY: kind
kind: ## Build and run container for kind
	./kind/start.sh

.PHONY: help
help: ## Makefile Help Page
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[\/\%a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-21s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST) 2>/dev/null
