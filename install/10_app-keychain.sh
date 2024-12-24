#!/bin/bash
# Installs Keychain

if command -v keychain &> /dev/null; then
	printf "\nINFO: Skipping Keychain install. Already installed.\n\n"
else
	printf "Insalling keychain..\n\n"
	sudo dnf install keychain -y
fi
