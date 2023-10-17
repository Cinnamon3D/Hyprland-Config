# Sign into root account and insall pkg and sudo with ("pkg install sudo") add user to the sudo group with ("visudo") type ("username ALL=(ALL:ALL) ALL")
#
# Make script excicutible with ("chmod +x" freebsd-install.sh")
sudo pkg install hyprland xdg-desktop-portal-hyprland drm-kmod seatd
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
sysrc seatd_enable=”YES”
service seatd start
pw groupmod video -m cinnamon
