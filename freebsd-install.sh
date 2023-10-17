sudo pkg install hyprland xdg-desktop-portal-hyprland drm-kmod seatd
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
sysrc seatd_enable=”YES”
service seatd start
pw groupmod video -m cinnamon
