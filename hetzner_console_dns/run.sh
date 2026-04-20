#!/bin/bash

# Set environment variables from options
export APIKEY="${APIKEY}"
export ZONENAME="${ZONENAME}"
export ARECORDNAMES__0="${ARECORDNAMES__0}"

# Print environment variables for debugging
echo "APIKEY: ${APIKEY}"
echo "ZONENAME: ${ZONENAME}"
echo "ARECORDNAMES__0: ${ARECORDNAMES__0}"

# Start the Hetzner DynDNS service
exec /entrypoint.sh
