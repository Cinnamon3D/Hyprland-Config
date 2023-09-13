sudo su
zypper update

#Install main GUI programs
zypper install google-chrome-stable hyprland kitty wofi thunar blueman nwg-look emacs breeze-cursor-theme 

#Install main CLI programs
zypper install flatpak zip unzip neofetch bluez swaybg btop polkit-gnome pamixer brightnessctl dunst pipewire xdg-desktop-portal-hyprland

#Find a pulkit, volume and brightness, screen lock,

systemctl enable bluetooth
systemctl start bluetooth

mv hyprland.conf ~/.config/hypr/
