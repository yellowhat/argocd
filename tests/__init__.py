#!/usr/bin/env python
"""Common functions"""

from ipaddress import ip_address
from kubernetes import client, config  # type: ignore
from dns.resolver import Resolver


def get_api_core() -> client.CoreV1Api:
    """Load kubeconfig and CoreV1Api"""
    config.load_kube_config()
    return client.CoreV1Api()


def get_api_apps() -> client.AppsV1Api:
    """Load kubeconfig and AppsV1Api"""
    config.load_kube_config()
    return client.AppsV1Api()


def get_api_custom() -> client.AppsV1Api:
    """Load kubeconfig and CustomObjectsApi"""
    config.load_kube_config()
    return client.CustomObjectsApi()


def check_deployments_nums(namespace: str, number: int) -> None:
    """Check deployments number"""
    api = get_api_apps()
    deploys = api.list_namespaced_deployment(namespace=namespace)
    assert len(deploys.items) == number, f"Deployments in {namespace}"


def check_deployments_status(namespace: str) -> None:
    """Check deployments status"""
    api = get_api_apps()
    for deploy in api.list_namespaced_deployment(namespace=namespace).items:
        status = deploy.status
        assert status.replicas == status.ready_replicas, f"Deployment {deploy.metadata.name}"
        assert status.replicas == status.available_replicas, f"Deployment {deploy.metadata.name}"
        assert status.unavailable_replicas is None, f"Deployment {deploy.metadata.name}"


def check_statefulsets_nums(namespace: str, number: int) -> None:
    """Check statefulsets number"""
    api = get_api_apps()
    sts = api.list_namespaced_stateful_set(namespace=namespace)
    assert len(sts.items) == number, f"Statefulsets in {namespace} namespace"


def check_statefulsets_status(namespace: str) -> None:
    """Check statefulsets status"""
    api = get_api_apps()
    for statefulset in api.list_namespaced_stateful_set(namespace=namespace).items:
        status = statefulset.status
        assert status.replicas == status.ready_replicas, f"Statefulset {statefulset.metadata.name}"
        assert status.replicas == status.available_replicas, f"Statefulset {statefulset.metadata.name}"


def check_pods_nums(namespace: str, number: int) -> None:
    """Check pods number"""
    api = get_api_core()
    pods = api.list_namespaced_pod(namespace=namespace)
    assert len(pods.items) == number, f"Pods in {namespace} namespace"


def check_pods_status(namespace: str) -> None:
    """Check pods status"""
    api = get_api_core()
    for pod in api.list_namespaced_pod(namespace=namespace).items:
        for status in pod.status.container_statuses:
            assert status.ready, f"pod {pod.metadata.name}, container {status.name} not ready"
            assert status.started, f"pod {pod.metadata.name}, container {status.name} not started"


def check_services_nums(namespace: str, number: int) -> None:
    """Check services number"""
    api = get_api_core()
    svcs = api.list_namespaced_service(namespace=namespace)
    assert len(svcs.items) == number, f"Services in in {namespace} namespace"


def check_dns(endpoint: str) -> None:
    """Check DNS resolve"""

    resolver = Resolver()
    resolver.nameservers = [endpoint]

    results = resolver.resolve("google.com", "NS")
    for result_ns in results:
        assert result_ns.to_text().startswith("ns")
        assert result_ns.to_text().endswith("google.com.")

    result_a = resolver.resolve("google.com", "A")
    assert result_a.nameserver == endpoint
    for rrset in result_a.rrset:  # type: ignore
        assert ip_address(rrset.address)
