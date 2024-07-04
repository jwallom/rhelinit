#!/bin/bash

printf "Installing Neovim...\n\n"

mkdir -p ~/projects/neovim
cd ~/projects/neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -zxf nvim-linux64.tar.gz
ln -s ~/projects/neovim/nvim-linux64/bin/nvim ~/bin/nvim
rm nvim-linux64.tar.gz
cd -
