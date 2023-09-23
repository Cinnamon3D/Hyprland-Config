#Install main GUI programs
pacman -S install hyprland kitty wofi thunar blueman

#Install main CLI programs
pacman -S flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager

#Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S nwg-look
yay -S google-chrome

systemctl enable Bluetooth
systemctl start Bluetooth

systemctl enable NetworkManager
systemctl start NetworkManager

mv hyprland.conf /$GOME/.config/hypr/
mv Wallpaper.jpg /$HOME/.config/hypr/
mv kitty.com /$HOMW/.config/kitty

pacman -Syu
yay -Syu
