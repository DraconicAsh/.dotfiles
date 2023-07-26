#!/bin/bash

US=$USER

sudo -s -- <<EOF
    # Ensure clean /etc/greetd directory
    rm -r /etc/greetd
    mkdir /etc/greetd
    
    # Hard link config files to /etc/greetd
    # Hard link is used so that user "greeter" can read files
    ln /home/$US/.dotfiles/etc/greetd/config.toml /etc/greetd
EOF
