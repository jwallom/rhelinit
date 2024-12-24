#!/bin/bash
# This requires the following gnome extensions be installed first:
# tactile
# just-perfection-desktop

if [ -f "$HOME/.rhelinit_complete " ]; then
	printf "\nINFO: Skipping Gnome Extensions. Remove %s to run configuration\n\n" "$HOME/.rhelinit_complete"
else
	printf "Configuring Gnome Extensions...\n\n"

	tactile_schema="$HOME/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml"
	justper_schema="$HOME/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml"

	if [ -f "$tactile_schema" ] && [ -f "$justper_schema" ]; then
		#Setup schemas
		cp "$tactile_schema" "$HOME/.local/share/glib-2.0/schemas"
		cp "$justper_schema" "$HOME/.local/share/glib-2.0/schemas"
		glib-compile-schemas "$HOME/.local/share/glib-2.0/schemas/"

		# Tactile Setup:
		gsettings set org.gnome.shell.extensions.tactile col-0 1
		gsettings set org.gnome.shell.extensions.tactile col-1 2
		gsettings set org.gnome.shell.extensions.tactile col-2 1
		gsettings set org.gnome.shell.extensions.tactile col-3 0
		gsettings set org.gnome.shell.extensions.tactile row-0 1
		gsettings set org.gnome.shell.extensions.tactile row-1 1
		gsettings set org.gnome.shell.extensions.tactile gap-size 15

		# Configure Just Perfection
		gsettings set org.gnome.shell.extensions.just-perfection animation 2
		gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
		gsettings set org.gnome.shell.extensions.just-perfection workspace true
		gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
	else
		printf "\n\nTactile and Just Perfection not installed\nInstall them first\n\n"
	fi
fi
