# Linux Incident Manager (im)

A DevOps + SRE focused Linux CLI tool for monitoring system health and
auto-remediating common incidents.

---

## Features

- CPU, Memory, Disk monitoring
- ASCII graph-style output
- Temp file inspection and cleanup
- Service monitoring with auto-remediation
- Docker container monitoring
- JSON output for automation
- Clean CLI UX

---

## Requirements

- Linux (Ubuntu/Debian recommended)
- systemd
- Bash
- sudo/root access (for remediation)

---

## Installation (GitHub)

```bash
git clone https://github.com/sundaresan-dev/linux-incident-manager.git
cd linux-incident-manager
chmod +x im install.sh
sudo ./install.sh
