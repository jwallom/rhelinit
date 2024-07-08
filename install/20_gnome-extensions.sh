#!/bin/bash
# This requires the following gnome extensions be installed first:
# tactile
# just-perfection-desktop

printf "Configuring Gnome Extensions...\n\n"

#pipx not in normal repo.  Need EPEL for it. Removing for now.
#sudo dnf install pipx -y
#pipx install gnome-extensions-cli --system-site-packages

# Install new extensions
#gext install tactile@lundal.io
#gext install just-perfection-desktop@just-perfection

tactile_schema="~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml"
justper_schema="~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml"

if [ -f $tactile_schema ] && [ -f $justper_schema ]; then
	#Setup schemas
	sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas
	sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

	# Tactile Setup:
	gsettings set org.gnome.shell.extensions.tactile col-0 1
	gsettings set org.gnome.shell.extensions.tactile col-1 2
	gsettings set org.gnome.shell.extensions.tactile col-2 1
	gsettings set org.gnome.shell.extensions.tactile col-3 0
	gsettings set org.gnome.shell.extensions.tactile row-0 1
	gsettings set org.gnome.shell.extensions.tactile row-1 1
	gsettings set org.gnome.shell.extensions.tactile gap-size 32

	# Configure Just Perfection
	gsettings set org.gnome.shell.extensions.just-perfection animation 2
	gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
	gsettings set org.gnome.shell.extensions.just-perfection workspace true
	gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
else
	printf "\n\nTactile and Just Perfection not installed\nInstall them first\n\n"
