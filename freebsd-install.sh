#!/bin/bash
# Sign into root account and insall pkg and sudo with ("pkg install sudo") add user to the sudo group with ("visudo") type ("username ALL=(ALL:ALL) ALL")
# Sign into user account and install git and bash with ("sudo pkg install git bash") the clone this repo with ("git clone https://github.com/SimeonBlack/Hyprland-Config")
# Make script excicutible with ("chmod +x" freebsd-install.sh") then run the script with ("bash ./freebsd-install.sh")

#_____________________________________________________________________________

echo "Installing Hyprland and needed packages..."
sudo pkg install kitty hyprland xdg-desktop-portal-hyprland drm-kmod seatd

echo "Enabling Services..."
export XDG_RUNTIME_DIR=/run/user/`id -u`
echo "export XDG_RUNTIME_DIR=/run/user/$(id -u)" >> ~/.shrc
sysrc seatd_enable=”YES”
service seatd start
pw groupmod video -m cinnamon

#_____________________________________________________________________________

echo "Would you like to install optional packages? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Installing optional packages..."
    sudo pkg install py39-ranger btop neofetch micro
elif [[ "$response" == "no" ]]; then
    echo "Okay, skipping..."
else
    echo "Invalid response. Please enter 'yes' or 'no'"
fi

#_____________________________________________________________________________

echo "Would you like to install other tools? (yes/no)"
read response

if [[ "$response" == "yes" ]]; then
    echo "Installing optional packages..."
    sudo pkg install python
elif [[ "$response" == "no" ]]; then
    echo "Okay, skipping..."
else
    echo "Invalid response. Please enter 'yes' or 'no'"
fi

#_____________________________________________________________________________

#Still need to add all packages to install, UI configs, and Wifi drivers, to the script
