#!/bin/bash
set -e

SHARE_DIR=/share/nextcloud
if [ ! -d "${SHARE_DIR}" ]; then
    mkdir -p "${SHARE_DIR}"
    mkdir -p "${SHARE_DIR}/html"
    chown -R www-data:root "${SHARE_DIR}"
    chmod -R g=u "${SHARE_DIR}"
fi

echo 'Hostname:'
hostname

/entrypoint.sh "$@"
