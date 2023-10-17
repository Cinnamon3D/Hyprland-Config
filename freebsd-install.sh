#!/bin/bash
# Sign into root account and insall pkg and sudo with ("pkg install sudo") add user to the sudo group with ("visudo") type ("username ALL=(ALL:ALL) ALL")
# Sign into user account and install git with ("sudo pkg install git") the clone this repo with ("git clone https://github.com/SimeonBlack/Hyprland-Config")
# Make script excicutible with ("chmod +x" freebsd-install.sh") then run the script with ("bash ./freebsd-install.sh")

sudo pkg install kitty hyprland xdg-desktop-portal-hyprland drm-kmod seatd
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
sysrc seatd_enable=”YES”
service seatd start
pw groupmod video -m cinnamon

echo "Would you like to install optional packages? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Installing optional packages..."
    sudo pkg install ranger btop neofetch
elif [[ "$response" == "no" ]]; then
    echo "Okay, skipping..."
else
    echo "Invalid response. Please enter 'yes' or 'no'"
fi
