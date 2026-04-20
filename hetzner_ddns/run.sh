#!/usr/bin/with-contenv bashio

set -a

#APIKEY=$(bashio::config 'APIKEY')
#ZONENAME=$(bashio::config 'ZONENAME')
#ARECORDNAMES__0=$(bashio::config 'ARECORDNAMES__0')

cd /App
exec dotnet HetznerApiDynDNS.dll
