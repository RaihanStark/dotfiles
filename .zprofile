# ~/.zprofile — Start Hyprland via uwsm automatically on tty1
export PATH="$HOME/.local/bin:$PATH"
export LIBVA_DRIVER_NAME="iHD"

if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
    if uwsm check may-start -q; then
        exec uwsm start -e -D Hyprland hyprland.desktop
    fi
fi
