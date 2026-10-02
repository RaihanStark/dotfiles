#!/usr/bin/env bash
# Region screenshot: select an area, copy it to the clipboard and save a copy.
# Bound to Print in hyprland.lua.
set -uo pipefail

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

# slurp exits non-zero when the selection is cancelled (Esc / right-click),
# in which case we bail out quietly rather than notifying about a failure.
GEOM=$(slurp -d \
    -b "#181820cc" \
    -c "#89b4faff" \
    -s "#89b4fa20" \
    -w 2 \
    -F "JetBrainsMono Nerd Font") || exit 0

[ -z "$GEOM" ] && exit 0

if grim -g "$GEOM" "$FILE"; then
    wl-copy < "$FILE"
    notify-send -a Screenshot -i "$FILE" \
        "Screenshot captured" "Copied to clipboard · $(basename "$FILE")"
else
    notify-send -a Screenshot -u critical "Screenshot failed" "grim could not capture the region"
fi
