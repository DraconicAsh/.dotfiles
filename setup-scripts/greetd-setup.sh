#!/bin/bash

# Ensure clean /etc/greetd directory
sudo -s -- <<EOF
    rm -r /etc/greetd
    mkdir /etc/greetd
EOF

# Hard link config files to /etc/greetd
# Hard link is used so that user "greeter" can read files
for file in ~/.dotfiles/etc/greetd/*; do
	if [ -f "$file" ]; then
	sudo ln $file /etc/greetd
	fi
done

# Copy background to /etc/greetd directory
sudo cp ~/.dotfiles/etc/greetd/backgrounds/bg.jpg /etc/greetd
