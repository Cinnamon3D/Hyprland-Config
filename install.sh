# Detect the package manager
if command -v apt &>/dev/null; then
    package_manager="apt"
    
elif command -v pacman &>/dev/null; then
    package_manager="pacman"
    
elif command -v dnf &>/dev/null; then
    package_manager="dnf"
    
elif command -v zypper &>/dev/null; then
    package_manager="zypper"
    
elif command -v pkg &>/dev/null; then
    package_manager="pkg"
    
else
    echo "Unsupported package manager"
    exit 1
fi

# Install packages
if [ "$package_manager" = "apt" ]; then
    apt update
    apt install -y
    
elif [ "$package_manager" = "pacman" ]; then
    pacman -S hyprland kitty wofi thunar blueman
    pacman -S flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager
    
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    
    yay -S nwg-look
    yay -S google-chrome

    pacman -Syu
    yay -Syu

elif [ "$package_manager" = "dnf" ]; then
    sudo dnf install -y 
    
elif [ "$package_manager" = "zypper" ]; then
    sudo zypper install -y 
    
elif [ "$package_manager" = "pkg" ]; then
    pkg install hyprland kitty wofi pcmanfm blueman bluez nwg-look firefox
    pkg install zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal network-manager
fi

systemctl enable Bluetooth
systemctl start Bluetooth

systemctl enable NetworkManager
systemctl start NetworkManager

mv hyprland.conf /$GOME/.config/hypr/
mv Wallpaper.jpg /$HOME/.config/hypr/
mv kitty.com /$HOMW/.config/kitty
