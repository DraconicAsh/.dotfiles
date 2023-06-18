#!/bin/bash

US=$USER

sudo -s -- <<EOF
    # Ensure clean /etc/greetd directory
    rm -r /etc/greetd
    mkdir /etc/greetd
    
    # Hard link config files to /etc/greetd
    # Hard link is used so that user "greeter" can read files
    ln /home/$US/.dotfiles/etc/greetd/config.toml /etc/greetd
    ln /home/$US/.dotfiles/etc/greetd/gtkgreet.css /etc/greetd
    
    # Copy background and environment file to /etc/greetd directory
    cp /home/$US/.dotfiles/etc/greetd/bg.jpg /etc/greetd
    cp /home/$US/.dotfiles/etc/greetd/environments /etc/greetd
EOF
