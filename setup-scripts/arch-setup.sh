#!/bin/bash

SHDIR=~/.dotfiles/setup-scripts
AUR=https://aur.archlinux.org

# Update system and install packages for basic environment
sudo pacman -Syu alsa-utils breeze-gtk greetd greetd-tuigreet gtk4 gvfs hyprland kitty mako meson neovim ninja noto-fonts noto-fonts-emoji openssh pipewire pipewire-alsa pipewire-jack pipewire-pulse qt6-wayland reflector ripgrep rustup thunar thunar-volman ttf-hack-nerd udisks2 ufw waybar wayland wget wireplumber wl-clipboard xdg-desktop-portal-hyprland zsh zsh-completions zsh-syntax-highlighting

# Clone Neovim config and run initial setup
/bin/bash ~/.dotfiles/setup-scripts/neovim.sh

# Creat symlinks for configs
/bin/bash ~/.dotfiles/setup-scripts/symlinks.sh

# Set rustup to and download stable branch
rustup default stable

# Enable Pipewire Stuff
systemctl --user enable --now pipewire.socket
systemctl --user enable --now pipewire-pulse.socket
systemctl --user enable --now wireplumber.service

# Enable services
sudo -s -- <<EOF
    systemctl enable NetworkManager.service
    systemctl enable ufw.service
    systemctl start ufw.service
    ufw start
    ufw default deny
    systemctl enable greetd.service
    systemctl enable systemd-timesyncd.service
EOF

# Acquire key for librewolf-bin
gpg --keyserver hkp://keyserver.ubuntu.com --search-keys 662E3CDD6FE329002D0CA5BB40339DD82B12EF16

# Clone and build AUR helper paru
mkdir ~/.build
cd ~/.build
git clone $AUR/paru-bin.git
cd paru-bin
makepkg -sirc

# Use paru for AUR packages
paru -S librewolf-bin tofi ttf-font-awesome-5 wpaperd
# git clone $AUR/greetd-gtkgreet-git.git
# git clone $AUR/librewolf-bin.git
# git clone $AUR/wpaperd.git
# git clone $AUR/font-awesome-5.git
#
# # Build and install packages
# for pkg in ~/.build/*; do
#     cd $pkg
#     makepkg -sic
# done
#
# # Clean leftover orphans from makedepends
# sudo pacman -Qtdg | pacman -Rns -
#
# # Setup greetd config
# /bin/bash ~/.dotfiles/setup-scripts/greetd-setup.sh

# Make zsh default shell
chsh -s /bin/zsh
