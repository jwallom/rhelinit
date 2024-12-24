#!/bin/bash
# This sets up gnome on RHEL 9 for my settings.

if [ -f "$HOME/.rhelinit_complete" ]; then
	printf "\nINFO: Skipping font installation. Remove %s to run configuration\n\n" "$HOME/.rhelinit_complete"
else
	printf "Installing Fonts...\n\n"

	# Setup fonts
	mkdir -p ~/.local/share/fonts

	cd /tmp || exit 3
	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/DejaVuSansMono.zip
	unzip DejaVuSansMono.zip -d DejaVuSansFont
	cp DejaVuSansFont/*.ttf ~/.local/share/fonts
	rm -rf DejaVuSansMono.zip DejaVuSansFont

	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
	unzip CascadiaMono.zip -d CascadiaFont
	cp CascadiaFont/*.ttf ~/.local/share/fonts
	rm -rf CascadiaMono.zip CascadiaFont

	fc-cache
	cd - || exit 3
fi
