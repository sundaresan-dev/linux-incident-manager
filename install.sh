#!/bin/bash

echo "[INFO] Installing Linux Incident Manager (im)..."

# Must run as root
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run as root (sudo)"
  exit 1
fi

# Absolute path of the cloned repo
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install binary
cp "$SCRIPT_DIR/im" /usr/local/bin/im
chmod +x /usr/local/bin/im

# Create config directory
mkdir -p /etc/im

echo "[SUCCESS] im installed successfully"
echo "[INFO] Binary installed at /usr/local/bin/im"
echo "[INFO] Config directory created at /etc/im"

# Auto delete local repo
echo "[CLEANUP] Removing local installer files..."
rm -rf "$SCRIPT_DIR"

echo "[DONE] Local repository removed"
echo "[INFO] Installation complete"
echo "[INFO] Run: im --help"

