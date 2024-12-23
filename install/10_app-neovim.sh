#!/bin/bash
# Installs Neovim.

file_name="nvim_auto.tar.gz"
proj_dir="$HOME/projects/neovim"
simlink="$HOME/bin/nvim"
nvim_config="./config/nvim.lua"

printf "Installing Neovim...\n\n"

sudo dnf install npm -y

mkdir -p $proj_dir
cd $proj_dir
wget -O - https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz > "$file_name"
shaval=$(sha256sum $file_name | awk '{print $1}')
versha=$(wget -qO - https://github.com/neovim/neovim/releases/latest/ | grep "nvim-linux64.tar.gz$" | grep -v "snippet-clipboard" | awk '{print $3}' | awk -F'>' '{print $3}')
if [ $versha == $shaval ]; then
	printf "\n$shaval\n\n"
else
	printf "\nIncorrect checksum! Aborting.\n\n"
	printf "Expected: %s\n" "$versha"
	printf "SHA256: %s\n" "$shaval"
	exit 5
fi
tar -axf $file_name

if [ -f $simlink ]; then
	rm $simlink
fi

ln -s $proj_dir/nvim-linux64/bin/nvim $simlink
rm $file_name
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
