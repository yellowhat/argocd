#!/usr/bin/env python
"""Test jellyfin namespace"""

from requests import get
from . import get_api_core
from . import check_deployments_nums, check_deployments_status
from . import check_statefulsets_nums
from . import check_pods_nums, check_pods_status
from . import check_services_nums

NAMESPACE = "jellyfin"
ENDPOINT = "192.168.0.202"


def test_nums() -> None:
    """Pods number"""

    check_deployments_nums(NAMESPACE, 1)
    check_statefulsets_nums(NAMESPACE, 0)
    check_pods_nums(NAMESPACE, 1)
    check_services_nums(NAMESPACE, 1)


def test_status() -> None:
    """Pods status"""

    check_deployments_status(NAMESPACE)
    check_pods_status(NAMESPACE)


def test_service() -> None:
    """Service"""

    api = get_api_core()
    svc = api.read_namespaced_service(namespace=NAMESPACE, name="jellyfin")
    assert svc.spec.type == "LoadBalancer"
    for port in svc.spec.ports:
        assert port.port == 80
    assert svc.status.load_balancer.ingress[0].ip == ENDPOINT
    assert svc.status.load_balancer.ingress[0].ports is None


def test_page() -> None:
    """Page"""

    response = get(f"http://{ENDPOINT}", timeout=10)
    assert response.status_code == 200
