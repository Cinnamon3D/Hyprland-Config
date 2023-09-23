#Install main GUI programs
zypper install hyprland kitty wofi thunar blueman

#Install main CLI programs
sudo pacman -S flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager

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

mv hyprland.conf $HOME~/.config/hypr/
mv Wallpaper.jpg $HOME~/.config/hypr/

sudo pacman -Syu
yay -Syu
