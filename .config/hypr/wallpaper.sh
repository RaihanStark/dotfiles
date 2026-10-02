#!/usr/bin/env bash
# hyprpaper 0.8.4 on this system ignores ~/.config/hypr/hyprpaper.conf
# entirely (an invalid key in it produces no parse error), so the wallpaper
# is applied over IPC once the daemon is accepting requests.
WALLPAPER="$HOME/Pictures/wallpapers/blue.jpg"

pgrep -x hyprpaper >/dev/null 2>&1 || hyprpaper >/dev/null 2>&1 &

# wait for the daemon's IPC socket (listactive is the request that works)
for _ in $(seq 1 40); do
    hyprctl hyprpaper listactive >/dev/null 2>&1 && break
    sleep 0.25
done

hyprctl hyprpaper wallpaper ",$WALLPAPER" >/dev/null 2>&1
