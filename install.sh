sudo su
zypper update

#Install main GUI programs
zypper install hyprland kitty wofi thunar blueman emacs breeze5-cursors

#Install main CLI programs
zypper install flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland network-manager

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
sudo rpm --import linux_signing_key.pub
sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
sudo zypper refresh
sudo zypper install google-chrome-stable

systemctl enable Bluetooth
systemctl start Bluetooth

systemctl enable NetworkManager
systemctl start NetworkManager

mv hyprland.conf ~/.config/hypr/
mv Wallpaper.jpg ~/.config/hypr/
