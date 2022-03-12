#!/bin/sh

# Basic Config
# Defaults
defaultServerName="DedCon Docker Server"
defaultKey="DEMOOF-MJSHVW-MOLIKG-FXIAFD-XQV"

defaultWelcome="This is a simple Defcon Dedicated Server running using DedCon Docker."

defaultAdvertisePlayers="1"
defaultMaxTeams="2"
defaultRandomTerritories="1"

# Config, the Config
sed -i "s/<ServerName>/${ServerName:-$defaultServerName}/g" /dedcon/config
sed -i "s/<ServerKey>/${ServerKey:-$defaultKey}/g" /dedcon/config

sed -i "s/<Welcome>/${Welcome:-$defaultWelcome}/g" /dedcon/config

sed -i "s/<AdvertisePlayers>/${AdvertisePlayers:-$defaultAdvertisePlayers}/g" /dedcon/config
sed -i "s/<MaxTeams>/${MaxTeams:-$defaultMaxTeams}/g" /dedcon/config
sed -i "s/<RandomTerritories>/${RandomTerritories:-$defaultRandomTerritories}/g" /dedcon/config

# Run Dedcon
while true; do
    /dedcon/bin/dedcon "${*}"
done
