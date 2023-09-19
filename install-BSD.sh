sudo pkg update

#Install main GUI programs
sudo pkg install hyprland kitty wofi pcmanfm blueman bluez nwg-look firefox

#Install main CLI programs
sudo pkg install zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal network-manager

systemctl enable Bluetooth
systemctl start Bluetooth

systemctl enable NetworkManager
systemctl start NetworkManager

mv hyprland.conf ~/.config/hypr/
mv Wallpaper.jpg ~/.config/hypr/
