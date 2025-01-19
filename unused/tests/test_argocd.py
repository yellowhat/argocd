#!/usr/bin/env python
"""Test argocd namespace"""

from . import get_api_core, get_api_custom
from . import check_deployments_nums, check_deployments_status
from . import check_statefulsets_nums, check_statefulsets_status
from . import check_pods_nums, check_pods_status
from . import check_services_nums

NAMESPACE = "argocd"


def test_nums() -> None:
    """Pods number"""

    check_deployments_nums(NAMESPACE, 6)
    check_statefulsets_nums(NAMESPACE, 1)
    check_pods_nums(NAMESPACE, 7)
    check_services_nums(NAMESPACE, 5)


def test_status() -> None:
    """Pods status"""

    check_deployments_status(NAMESPACE)
    check_statefulsets_status(NAMESPACE)
    check_pods_status(NAMESPACE)


def test_service() -> None:
    """Service"""

    api = get_api_core()
    svc = api.read_namespaced_service(namespace=NAMESPACE, name="argocd-server")
    assert svc.spec.type == "NodePort"


def test_apps() -> None:
    """Applications"""

    expected = {
        "app-of-apps": {
            "num_resources": 4,
        },
        "fritz-exporter": {
            "num_resources": 4,
        },
        "jellyfin": {
            "num_resources": 4,
        },
        "blocky": {
            "num_resources": 10,
        },
        "system": {
            "num_resources": 165,
        },
    }

    api = get_api_custom()
    apps = api.list_namespaced_custom_object(
        group="argoproj.io",
        version="v1alpha1",
        namespace=NAMESPACE,
        plural="applications",
    )
    assert len(apps["items"]) == 5
    for app in apps["items"]:
        name = app["metadata"]["name"]
        assert name in expected
        assert app["status"]["health"]["status"] == "Healthy"
        assert app["status"]["sync"]["status"] == "Synced"
        assert app["status"]["operationState"]["phase"] == "Succeeded"
        assert len(app["status"]["resources"]) == expected[name]["num_resources"]
