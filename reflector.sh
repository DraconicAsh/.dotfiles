#!/bin/sh

reflector --country 'United States' --latest 15 --sort rate --save /etc/pacman.d/mirrorlist
