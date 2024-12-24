#!/bin/bash

if [ -f "$HOME/.rhelinit_complete" ]; then
	printf "\nINFO: Skipping Home Directory Setup. Remove %s to run configuration\n\n" "$HOME/.rhelinit_complete"
else
	mkdir -p ~/projects
	mkdir -p ~/bin

	# Basic Git Config
	git_config="./config/gitconfig"
	if [ -f $git_config ]; then
		if [ ! -f $HOME/.gitconfig ]; then
			cp $git_config ~/.gitconfig
		else
			printf "\n\nExisting git configuration found\n\n"
		fi
	else
		printf "\n\n\Git config not found.\n\n"
	fi
fi
