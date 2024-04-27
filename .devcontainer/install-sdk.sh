#!/usr/bin/env sh

name="connectiq-sdk-manager-linux.zip"

set -eux

apt-get update
apt-get install -y \
    curl \
    unzip

curl -L -o "/tmp/$name" "https://developer.garmin.com/downloads/connect-iq/sdk-manager/$name"
unzip "/tmp/$name" -d /opt/sdk-manager
rm -rf "/tmp/$name"

apt-get install -y libgtk-3-0 libwebkit2gtk-4.0-37
