#!/bin/bash

# Remove the "us" subdomain for sources.
sed -i 's/http:\/\/us./http:\/\//g' /etc/apt/sources.list

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
