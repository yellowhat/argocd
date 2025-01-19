#!/usr/bin/env python3
"""Create albums in Immich from file structure"""

import logging
from collections import defaultdict
from json import dumps, loads
from os import environ
from time import sleep, time
from typing import Any, Optional
from urllib.error import HTTPError
from urllib.request import Request, urlopen

BASE_URL = f"http://{environ['HOST']}:{environ['PORT']}/api"

ADMIN_EMAIL = "admin@mukka.haus"
ADMIN_PASS = "admin"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def make_request(
    path: str,
    payload: Optional[object] = None,
    token: Optional[str] = None,
) -> Any:
    """Make requests"""

    headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
    }

    if token is not None:
        headers["Authorization"] = f"Bearer {token}"
        # headers["X-api-key"] = token

    request = Request(
        url=f"{BASE_URL}/{path}",
        headers=headers,
        data=dumps(payload).encode("utf8") if payload is not None else None,
    )
    with urlopen(request) as response:
        return loads(response.read() or 'null')


class Immich():

    def __init__(self):
        """Login to instance or create a initial user"""

        logger.info("Try to create initial user")
        try:
            make_request(
                path="auth/admin-sign-up",
                payload={
                    "name": "admin",
                    "email": ADMIN_EMAIL,
                    "password": ADMIN_PASS,
                },
                token=None,
            )
        except HTTPError as err:
            if err.code != 400:
                raise ValueError(err)
            logger.info("Initial user already created")

        logger.info("Login")
        user = make_request(
            path="auth/login",
            payload={
                "email": ADMIN_EMAIL,
                "password": ADMIN_PASS,
            },
            token=None
        )
        self.user_id = user["userId"]
        self.token = user["accessToken"]

    def refresh_library(self) -> None:
        """Refresh library"""

        logger.info("Get libraries:")
        libraries = make_request(
            path="libraries",
            payload=None,
            token=self.token,
        )
        logger.info(dumps(libraries, indent=4))

        if not libraries:
            logger.info("Creating new library")
            libraries = make_request(
                path="libraries",
                payload={
                    "name": "local",
                    "importPaths": ["/usr/src/app/import"],
                    "ownerId": self.user_id,
                    "exclusionPatterns": [],
                },
                token=self.token,
            )
            library_id = libraries["id"]
        else:
            library_id = libraries[0]["id"]

        logger.info("Refreshing library")
        make_request(
            path=f"libraries/{library_id}/scan",
            payload={
                "refreshAllFiles": False,
                "refreshModifiedFiles": True,
            },
            token=self.token,
        )

    def wait_for_job(self, job_name: str, want_status: bool) -> None:
        """Wait for completion of a job"""

        start = time()
        while True:
            logger.info(f"Waiting for job {job_name} to be isActive={want_status}, elapsed {time() - start:.1f}sec")
            jobs = make_request(
                path="jobs",
                payload=None,
                token=self.token,
            )
            if jobs[job_name]["queueStatus"]["isActive"] == want_status:
                return
            sleep(1)

    def get_assets(self) -> list[dict[str, str]]:
        """Get list of assets """

        assets = []
        next_page, page = True, 1
        while next_page:
            response = make_request(
                path="search/metadata",
                payload={
                    "isNotInAlbum": True,
                    "page": page,
                },
                token=self.token,
            )
            next_page = response["assets"]["nextPage"]
            page = response["assets"]["nextPage"]
            assets.extend(response["assets"]["items"])
        logger.info(f"Received {len(assets)} assets")
        return assets

    def organize_assets(self, assets: list[dict[str, str]]) -> None:
        """Organize assets in albums"""

        # /usr/src/app/import/<year>/<name>/<name>.jpeg
        albums = defaultdict(list)
        for asset in assets:
            album_name = " - ".join(asset["originalPath"].split("/")[-3:-1])
            albums[album_name].append(asset["id"])

        for album_name, album_assets in albums.items():
            logger.info(f"Album '{album_name}': {len(album_assets)} assets")
            make_request(
                path="albums",
                payload={
                    "albumName": album_name,
                    "description": album_name,
                    "albumUsers": [
                        {
                            "userId": self.user_id,
                            "role": "editor",
                        }
                    ],
                    "assetIds": album_assets,
                },
                token=self.token,
            )


if __name__ == "__main__":

    immich = Immich()

    immich.refresh_library()
    immich.wait_for_job("library", True)
    immich.wait_for_job("metadataExtraction", False)

    assets = immich.get_assets()
    immich.organize_assets(assets)
