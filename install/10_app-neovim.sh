#!/bin/bash
# Installs Neovim.

nvim_config="./config/nvim.lua"

# Neovim 0.10.0 sha256 from:
# https://github.com/neovim/neovim/releases
versha="be189915a2a0da3615576e2db06a7c714aef0ae926b4da6107e589a3cc623e5c"

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
	if [ ! -f $HOME/.config/nvim/init.lua ]; then
		mkdir -p ~/.config/nvim
		cp $nvim_config ~/.config/nvim/init.lua
	else
		printf "\n\nExisting Neovim config found\n\n"
	fi
else
	printf "\n\nNeovim config not found\n\n"
fi
