#!/bin/bash
# Installs Neovim.

nvim_config="./config/nvim.lua"

# Neovim 0.10.0 sha256 from:
# https://github.com/neovim/neovim/releases
versha="be1f0988d0de71c375982b87b86cd28d2bab35ece8285abe3b0aac57604dfc5a"

printf "Installing Neovim...\n\n"

sudo dnf install ripgrep npm -y

mkdir -p ~/projects/neovim
cd ~/projects/neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
shaval=$(sha256sum nvim-linux64.tar.gz | awk '{print $1}')
if [ $versha == $shaval ]; then
	printf "\n$shaval\n\n"
else
	printf "\n$shaval\n\n"
fi
tar -zxf nvim-linux64.tar.gz
ln -s ~/projects/neovim/nvim-linux64/bin/nvim ~/bin/nvim
rm nvim-linux64.tar.gz
cd -

if [ -f $nvim_config ]; then
	mkdir -p ~/.config/nvim
	cp $nvim_config ~/.config/nvim/init.lua
else
	printf "\n\nNeovim config not found\n\n"
fi
