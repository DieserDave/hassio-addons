#!/usr/bin/with-contenv bashio

set -a

ZONE_NAME=$(bashio::config 'ZONE_NAME')
API_TOKEN=$(bashio::config 'API_TOKEN')
RECORD_TYPE=$(bashio::config 'RECORD_TYPE')
RECORD_NAME=$(bashio::config 'RECORD_NAME')
CRON_EXPRESSION=$(bashio::config 'CRON_EXPRESSION')
TTL=$(bashio::config 'TTL')

exec /hetzner-ddns
