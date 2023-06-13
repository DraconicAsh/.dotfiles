#!/bin/bash

# Create cymbolic links for .config files
for file in ~/.dotfiles/dotconfig/*; do
	ln -sf $file ~/.config
done

# Create symbolic links for home directory files
for file in ~/.dotfiles/home/.*; do
	ln -sf $file ~
done
