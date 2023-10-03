#!/bin/bash

git clone https://github.com/DraconicAsh/kickstart.nvim.git ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
