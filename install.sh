#!/bin/bash
set -e

echo "[INFO] Installing Linux Incident Manager (im)..."

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run as root (sudo)"
  exit 1
fi

# Temp working directory
TMP_DIR=$(mktemp -d)
REPO_URL="https://github.com/sundaresan-dev/linux-incident-manager.git"

echo "[INFO] Downloading source to temp directory..."
git clone --depth=1 "$REPO_URL" "$TMP_DIR"

# Install binary
cp "$TMP_DIR/im" /usr/local/bin/im
chmod +x /usr/local/bin/im

# Create config directory
mkdir -p /etc/im

# Cleanup
echo "[CLEANUP] Removing temporary files..."
rm -rf "$TMP_DIR"

echo "[SUCCESS] Linux Incident Manager installed"
echo "[INFO] Binary location: /usr/local/bin/im"
echo "[INFO] Run: im --help"
