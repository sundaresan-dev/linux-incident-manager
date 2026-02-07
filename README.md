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

## Installation (Recommended)

Install using a one-line bootstrap command:

```bash
curl -fsSL https://raw.githubusercontent.com/sundaresan-dev/linux-incident-manager/main/install.sh | sudo bash
