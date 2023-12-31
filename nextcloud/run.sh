#!/bin/bash
set -e

echo 'Hostname:'
hostname
echo ''

CONFIG_PATH=/data/options.json
echo 'Starting with the following configuration:';
jq --raw-output 'keys[] as $k | select(.[$k] != "" and .[$k] != null) | "\t" + ($k | ascii_upcase) + "=\"" + (.[$k]|tostring) + "\""' $CONFIG_PATH;
eval $(jq --raw-output 'keys[] as $k | select(.[$k] != "" and .[$k] != null) | "export " + ($k | ascii_upcase) + "=\"" + (.[$k]|tostring) + "\""' $CONFIG_PATH);

SHARE_DIR=/share/nextcloud
if [ ! -d "${SHARE_DIR}" ]; then
    mkdir -p "${SHARE_DIR}"
    mkdir -p "${SHARE_DIR}/html"
    chown -R www-data:root "${SHARE_DIR}"
    chmod -R g=u "${SHARE_DIR}"
fi

user='www-data'
run_as() {
    if [ "$(id -u)" = 0 ]; then
        su -p "$user" -s /bin/sh -c "$1"
    else
        sh -c "$1"
    fi
}

if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS+x}" ]; then
    echo "Setting trusted domains…"
    NC_TRUSTED_DOMAIN_IDX=1
    for DOMAIN in $NEXTCLOUD_TRUSTED_DOMAINS ; do
        DOMAIN=$(echo "$DOMAIN" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        run_as "php $SHARE_DIR/html/occ config:system:set trusted_domains $NC_TRUSTED_DOMAIN_IDX --value=$DOMAIN"
        NC_TRUSTED_DOMAIN_IDX=$((NC_TRUSTED_DOMAIN_IDX+1))
    done
fi

if [ -n "${OVERWRITE_CLI_URL+x}" ]; then
    echo "Setting overwrite.cli.url…"
    run_as "php $SHARE_DIR/html/occ config:system:set overwrite.cli.url --value ${OVERWRITE_CLI_URL}"
fi

if [ -n "${OVERWRITEPROTOCOL+x}" ]; then
    echo "Setting overwriteprotocol…"
    run_as "php $SHARE_DIR/html/occ config:system:set overwriteprotocol --value ${OVERWRITEPROTOCOL}"
fi

/entrypoint.sh "$@"
