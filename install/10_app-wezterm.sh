#!/bin/bash
# Installs Wezterm

printf "Installing Wezterm..\n\n"

mkdir -p ~/projects/wezterm
cd ~/projects/wezterm
wget https://github.com/wez/wezterm/releases/latest/download/wezterm-20240203_110809_5046fc22-1.centos9.x86_64.rpm
wget https://github.com/wez/wezterm/releases/latest/download/wezterm-20240203_110809_5046fc22-1.centos9.x86_64.rpm.sha256
if sha256sum -c wezterm-20240203_110809_5046fc22-1.centos9.x86_64.rpm.sha256; then
	sudo dnf install ./wezterm-20240203_110809_5046fc22-1.centos9.x86_64.rpm -y
else
	printf "${red}Checksum failure for Wezterm. Exiting.${normal}\n\n"
	exit 1
fi
cd -

cp ./config/wezterm.lua ~/.wezterm.lua
