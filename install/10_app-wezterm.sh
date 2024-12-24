#!/bin/bash
# Installs Wezterm

wez_config="./config/wezterm.lua"
version="20240203_110809_5046fc22"

if [ "$(echo $version | tr '_' '-')" == "$(wezterm --version | awk '{print $2}')" ]; then
	printf "\nINFO: Skipping Wezterm installation. It is already the latest version.\n\n"
else
	printf "Installing Wezterm..\n\n"

	mkdir -p ~/projects/wezterm
	cd ~/projects/wezterm || exit 3
	wget "https://github.com/wez/wezterm/releases/latest/download/wezterm-${version}-1.centos9.x86_64.rpm"
	wget "https://github.com/wez/wezterm/releases/latest/download/wezterm-${version}-1.centos9.x86_64.rpm.sha256"
	if sha256sum -c "wezterm-$version.centos9.x86_64.rpm.sha256"; then
		sudo dnf install ./wezterm-$version.centos9.x86_64.rpm -y
	else
		printf "\nERROR:Checksum failure for Wezterm. Exiting.\n\n"
		exit 1
	fi
	cd - || exit 3

	cp ./config/wezterm.lua ~/.wezterm.lua
	if [ -f $wez_config ]; then
		if [ ! -f "$HOME/.wezterm.lua" ]; then
			cp $wez_config ~/.wezterm.lua
		else
			printf "\n\nExistin Wezterm config found\n\n"
		fi
	else
		printf "\n\nWezterm config not found\n\n"
	fi
fi
