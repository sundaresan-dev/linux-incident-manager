#!/bin/bash

echo "[INFO] Installing Linux Incident Manager (im)..."

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run as root (sudo)"
  exit 1
fi

cp im /usr/local/bin/im
chmod +x /usr/local/bin/im

mkdir -p /etc/im

echo "[SUCCESS] im installed successfully"
echo "[INFO] Run: im --help"

