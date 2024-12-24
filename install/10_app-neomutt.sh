#!/bin/bash
# Installs Neomutt

if command -v neomutt &> /dev/null; then
	printf "\nINFO: Skipping Neomutt installation. Already installed\n\n"
else
	printf "Insalling Neomutt..\n\n"
	sudo dnf install neomutt lynx -y
fi
