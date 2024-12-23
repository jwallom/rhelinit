#!/bin/bash
# Installs Neovim.

app_name="nvim"  #This is the name of the application. Should be lower case.
file_type="tar.gz"  #Defaults to tar.gz, but is used to determine how to uncompress the installation. "tar.XX" and "zip" are valid
proj_dir="$HOME/projects/$app_name"  #Change if you want installed in a different location
simlink="$HOME/bin/$app_name"  #Change if you want the executable called something different than $app_name
url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"  #URL for the project to get the binaries
checksum=true  #If you want to check the download's checksum, leave true. Requires the versha variable as the sha256sum to validate against
versha="empty"
linker=false #If this package creates a custom folder for each version and you want a consistant path for the symbolic link.

# This is an exampl for dynamically getting and setting the sha256sum from a repo.
versha=$(wget -qO - https://github.com/neovim/neovim/releases/latest/ | grep "nvim-linux64.tar.gz$" | grep -v "snippet-clipboard" | awk '{print $3}' | awk -F'>' '{print $3}')

# Now we can call the installer function. Requires 8 things
install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"

# We need npm to install some LSP function.
if command -v npm &> /dev/null; then
	printf "\nnpm is installed, skipping...\n\n"
else
	sudo dnf install npm -y
fi
