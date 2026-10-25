#!/bin/sh
# Clear jsDelivr's cache of this plug-in at @latest, after a new tag: jsDelivr
# resolves @latest file by file and keeps each answer (a failure too) for up
# to a day. Run from the repository's root.
set -e
cd "$(dirname "$0")/.."
owner_repo="${1:-uplus-type/fontra-tutorials}"
for f in plugin.json init.js panel.js tour.js icon.svg tours/*.js; do
  printf '%s: ' "$f"
  curl -sS "https://purge.jsdelivr.net/gh/$owner_repo@latest/$f" | grep -o '"status": *"[a-z]*"' || echo
done
