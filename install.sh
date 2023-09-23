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
    dnf install -y hyprland kitty wofi thunar blueman emacs breeze5-cursors
    dnf install -y --no-recommends lxappearance
    dnf install -y flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager
    
elif [ "$package_manager" = "zypper" ]; then
    sudo zypper install -y zypper install hyprland kitty wofi thunar blueman emacs breeze5-cursors
    zypper install -y --no-recommends lxappearance
    zypper install -y flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
    rpm --import linux_signing_key.pub
    zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
    zypper refresh
    zypper install google-chrome-stable
    
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
