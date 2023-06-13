#!/bin/bash

SHDIR=~/.dotfiles/setup-scripts
AUR=https://aur.archlinux.org

# Update system and install packages for basic environment
sudo pacman -Syu alsa-utils bemenu cage greetd gtk4 kitty neovim openssh pipewire pipewire-jack qt6-wayland river rustup ttf-hack-nerd ttf-ibm-plex waybar wayland wireplumber zsh zsh-completions

# Creat symlinks for configs
/bin/bash ~/.dotfiles/setup-scripts/symlinks.sh

# Set rustup to and download stable branch
rustup default stable

# Enable greetd and timesync and acquire key for librewolf-bin
sudo -s -- <<EOF
    systemctl enable greetd.service
    systemctl enable systemd-timesyncd.service
    gpg --keyserver hkp://keyserver.ubuntu.com --search-keys 662E3CDD6FE329002D0CA5BB40339DD82B12EF16
EOF

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

# Creat hard links for greetd config
/bin/bash ~/.dotfiles/setup-scripts/greetd-setup.sh

# Make zsh default shell
chsh -s /bin/zsh

echo Run "systemctl --user enable --now ssh-agent" after reboot to enable ssh-agent
