#!/bin/bash

SHDIR=~/.dotfiles/setup-scripts
AUR=https://aur.archlinux.org

# Update system and install packages for basic environment
sudo pacman -Syu alsa-utils bemenu cage greetd gtk4 hyprland kitty neovim openssh pipewire pipewire-jack qt6-wayland rustup ttf-hack-nerd ttf-ibm-plex ufw waybar wayland wget wireplumber zsh zsh-completions zsh-syntax-highlighting

# Clone NvChad for Neovim config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Creat symlinks for configs
/bin/bash ~/.dotfiles/setup-scripts/symlinks.sh

# Set rustup to and download stable branch
rustup default stable

# Enable WirePLumber
systemctl --user enable wireplumber.service

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

# Clone PKGBUILDs for packages needed from the User Repository
mkdir ~/.build
cd ~/.build
git clone $AUR/greetd-gtkgreet-git.git
git clone $AUR/librewolf-bin.git
git clone $AUR/swww.git
git clone $AUR/font-awesome-5.git

# Build and install packages
for pkg in ~/.build/*; do
    cd $pkg
    makepkg -sic
done

# Clean leftover orphans from makedepends
sudo pacman -Qtdg | pacman -Rns -

# Setup greetd config
/bin/bash ~/.dotfiles/setup-scripts/greetd-setup.sh

# Make zsh default shell
chsh -s /bin/zsh

# Launch nvim for initial setup
nvim
