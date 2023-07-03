#!/bin/bash

systemctl --user enable --now ssh-agent

eval "$(ssh-agent -s)"
