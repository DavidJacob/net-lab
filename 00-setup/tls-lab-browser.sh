#!/usr/bin/env bash
# net-lab/00-setup/tls-lab-browser.sh — throwaway Chromium; keylog + profile in /tmp (RAM, gone on reboot)
# Pass a URL as an argument to the script to generate traffic
set -euo pipefail

STATE="/tmp/net-lab-$USER" # /tmp is world-writable+sticky → scope per-user, lock perms
mkdir -p -m 700 "$STATE"
KEYLOG="$STATE/tls-keylog.txt"

echo "TLS keys → $KEYLOG"
SSLKEYLOGFILE="$KEYLOG" exec chromium \
  --user-data-dir="$STATE/chromium-lab" \
  "$@"
