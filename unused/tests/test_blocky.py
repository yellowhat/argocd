#!/usr/bin/env python
"""Test blocky namespace"""

from requests import get
from . import get_api_core
from . import check_deployments_nums, check_deployments_status
from . import check_statefulsets_nums
from . import check_pods_nums, check_pods_status
from . import check_services_nums
from . import check_dns

NAMESPACE = "blocky"
ENDPOINT = "192.168.0.201"


def test_nums() -> None:
    """Pods number"""

    check_deployments_nums(NAMESPACE, 1)
    check_statefulsets_nums(NAMESPACE, 0)
    check_pods_nums(NAMESPACE, 1)
    check_services_nums(NAMESPACE, 3)


def test_status() -> None:
    """Pods status"""

    check_deployments_status(NAMESPACE)
    check_pods_status(NAMESPACE)


def test_service() -> None:
    """Service"""

    expected = {
        "blocky-http": {
            "port": [80, 443],
        },
        "blocky-dns-udp": {
            "port": [53],
        },
        "blocky-dns-tcp": {
            "port": [53, 9617],
        },
    }

    api = get_api_core()
    for svc_name, svc_conf in expected.items():
        svc = api.read_namespaced_service(namespace=NAMESPACE, name=svc_name)
        assert svc.spec.type == "LoadBalancer"
        for port in svc.spec.ports:
            assert port.port in svc_conf["port"]
        assert svc.status.load_balancer.ingress[0].ip == ENDPOINT
        assert svc.status.load_balancer.ingress[0].ports is None


def test_dns() -> None:
    """DNS resolve"""

    check_dns(ENDPOINT)


def test_page() -> None:
    """Page"""

    response = get(f"http://{ENDPOINT}", timeout=10)
    assert response.status_code == 200
