#!/usr/bin/env python
"""Test system namespace"""

from json import loads
from kubernetes.stream import stream  # type: ignore
from requests import get
from . import get_api_core
from . import check_deployments_nums, check_deployments_status
from . import check_statefulsets_nums, check_statefulsets_status
from . import check_pods_nums, check_pods_status
from . import check_services_nums

NAMESPACE = "system"
ENDPOINT = "192.168.0.200"


def test_nums() -> None:
    """Pods number"""

    check_deployments_nums(NAMESPACE, 5)
    check_statefulsets_nums(NAMESPACE, 2)
    check_pods_nums(NAMESPACE, 9)
    check_services_nums(NAMESPACE, 9)


def test_status() -> None:
    """Pods status"""

    check_deployments_status(NAMESPACE)
    check_statefulsets_status(NAMESPACE)
    check_pods_status(NAMESPACE)


def test_grafana_service() -> None:
    """Grafana service"""

    api = get_api_core()
    svc = api.read_namespaced_service(namespace=NAMESPACE, name="system-grafana")
    assert svc.spec.type == "LoadBalancer"
    assert svc.status.load_balancer.ingress[0].ip == ENDPOINT
    assert svc.status.load_balancer.ingress[0].ports is None


def test_grafana_page() -> None:
    """Grafana page"""

    response = get(f"http://{ENDPOINT}", timeout=10)
    assert response.status_code == 200


def test_prometheus_pods_nums() -> None:
    """Prometheus pods number"""

    api = get_api_core()
    pods = api.list_namespaced_pod(namespace=NAMESPACE, label_selector="prometheus")
    assert len(pods.items) == 1, "Multiple pods found with label 'prometheus'"


def test_prometheus_targets() -> None:
    """Prometheus targets"""

    api = get_api_core()
    pods = api.list_namespaced_pod(namespace=NAMESPACE, label_selector="prometheus")
    resp = stream(
        api.connect_get_namespaced_pod_exec,
        name=pods.items[0].metadata.name,
        namespace=NAMESPACE,
        container="prometheus",
        command=[
            "wget",
            "-q",
            "-O",
            "-",
            "http://localhost:9090/api/v1/targets?state=any",
        ],
        stdin=False,
        stderr=False,
        stdout=True,
        tty=False,
        _preload_content=False,
    )
    while resp.is_open():
        resp.update(timeout=10)
    data = loads(resp.read_stdout())

    assert data["status"] == "success"
    assert len(data["data"]["activeTargets"]) == 17

    print("[INFO] Prometheus - Active targets")
    print(f"{'Scrape Pool':80s} | {'Health':10s} |")
    print(f"{'-'*80:80s} | {'-'*10:10s} |")
    for target in data["data"]["activeTargets"]:
        print(f"{target['scrapePool']:80s} | {target['health']:10s} |")
        assert target["health"] == "up"
        assert target["scrapeInterval"] in ["30s", "1m"]


def test_loki_service() -> None:
    """Loki service"""

    api = get_api_core()
    svc = api.read_namespaced_service(namespace=NAMESPACE, name="system-loki")
    assert svc.spec.type == "ClusterIP"
