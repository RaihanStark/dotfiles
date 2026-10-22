#!/usr/bin/env bash
set -euo pipefail

case "${1:-}" in
    vol-up)
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    vol-down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    vol-mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    mic-mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        OUT="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"
        if [[ "$OUT" == *"[MUTED]"* ]]; then
            notify-send -h string:x-dunst-stack-tag:osd -t 1500 "Microphone" "Muted"
        else
            notify-send -h string:x-dunst-stack-tag:osd -t 1500 "Microphone" "Unmuted"
        fi
        exit 0
        ;;
    bri-up)
        brightnessctl -e4 -n2 set 5%+ >/dev/null
        ;;
    bri-down)
        brightnessctl -e4 -n2 set 5%- >/dev/null
        ;;
esac

if [[ "${1:-}" == vol-* ]]; then
    OUT="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
    VOL="$(awk '{printf "%d", $2 * 100}' <<< "$OUT")"
    if [[ "$OUT" == *"[MUTED]"* ]]; then
        notify-send -h string:x-dunst-stack-tag:osd -h int:value:0 -t 1500 "Volume: Muted (${VOL}%)"
    else
        notify-send -h string:x-dunst-stack-tag:osd -h int:value:"$VOL" -t 1500 "Volume: ${VOL}%"
    fi
elif [[ "${1:-}" == bri-* ]]; then
    BRI="$(brightnessctl -m | awk -F, '{gsub(/%/,"",$4); print $4}')"
    notify-send -h string:x-dunst-stack-tag:osd -h int:value:"$BRI" -t 1500 "Brightness: ${BRI}%"
fi
