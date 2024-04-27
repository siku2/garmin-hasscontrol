#!/usr/bin/env bash
set -euo pipefail

_HOME_DIR="$HOME"
_SDK_DIR="$_HOME_DIR/sdk"
_SDK_NAME="connectiq-sdk-lin-8.1.1-2025-03-27-66dae750f"

install_sdk() {
    local download_path="/tmp/${_SDK_NAME}.zip"
    wget --output-document "$download_path" \
        "https://developer.garmin.com/downloads/connect-iq/sdks/${_SDK_NAME}.zip"
    unzip -oq "$download_path" -d "$_SDK_DIR"
    rm -rf "$download_path"

    echo "export PATH=\"$_SDK_DIR/bin:\$PATH\"" >>/etc/bash.bashrc
}

install_devices() {
    local download_path="/tmp/devices.zip"
    wget --output-document "$download_path" "https://hatl.at/devices.zip"
    unzip -oq "$download_path" -d "$_HOME_DIR"
    rm -rf "$download_path"
}

generate_developer_key() {
    openssl genrsa -out "$_HOME_DIR/developer_key.pem" 4096
    openssl pkcs8 -topk8 -inform PEM -outform DER -in "$_HOME_DIR/developer_key.pem" -out "$_HOME_DIR/developer_key.der" -nocrypt
}

main() {
    local deps=(
        # required to download
        unzip
        # sdk dependencies
        default-jre
        libgtk-3-0
        libwebkit2gtk-4.0-37
    )

    apt-get update
    apt-get install -y --no-install-recommends "${deps[@]}"

    install_sdk
    install_devices
    generate_developer_key

    rm -f "$0"
}

main
