#!/bin/bash
set -e
set -o pipefail

echo "[INFO] Installing Linux Incident Manager (im)..."

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run as root (use sudo)"
  exit 1
fi

# Detect package manager
if command -v apt >/dev/null 2>&1; then
  PKG="apt"
elif command -v dnf >/dev/null 2>&1; then
  PKG="dnf"
elif command -v yum >/dev/null 2>&1; then
  PKG="yum"
elif command -v pacman >/dev/null 2>&1; then
  PKG="pacman"
else
  echo "[ERROR] No supported package manager found (apt/dnf/yum/pacman)"
  exit 1
fi

echo "[INFO] Detected package manager: $PKG"

# Install git if not present
if ! command -v git >/dev/null 2>&1; then
  echo "[INFO] Git not found. Installing git..."

  case "$PKG" in
    apt)
      apt update
      apt install -y git
      ;;
    dnf)
      dnf install -y git
      ;;
    yum)
      yum install -y git
      ;;
    pacman)
      pacman -Sy --noconfirm git
      ;;
  esac
fi

# Refresh command cache
hash -r

# Verify git again
if ! command -v git >/dev/null 2>&1; then
  echo "[ERROR] Git installation failed or git not in PATH!"
  exit 1
fi

echo "[INFO] Git is available: $(which git)"

# Temp working directory
TMP_DIR=$(mktemp -d)
REPO_URL="https://github.com/sundaresan-dev/linux-incident-manager.git"

echo "[INFO] Downloading source..."
git clone --depth=1 "$REPO_URL" "$TMP_DIR"

# Check binary
if [ ! -f "$TMP_DIR/im" ]; then
  echo "[ERROR] im binary not found in repository!"
  rm -rf "$TMP_DIR"
  exit 1
fi

# Backup existing binary
if [ -f /usr/local/bin/im ]; then
  echo "[INFO] Existing im found. Backing up..."
  cp /usr/local/bin/im /usr/local/bin/im.bak.$(date +%s)
fi

# Install binary
echo "[INFO] Installing im to /usr/local/bin/im"
cp "$TMP_DIR/im" /usr/local/bin/im
chmod +x /usr/local/bin/im

# Create config dir
mkdir -p /etc/im

# Cleanup
rm -rf "$TMP_DIR"

echo "[SUCCESS] Linux Incident Manager installed successfully ✅"
echo "[INFO] Run: im --help"
