#!/bin/bash

mkdir -p ~/projects
mkdir -p ~/bin

# Basic Git Config
git_config="./config/gitconfig"
if [ -f $git_config ]; then
	cp $git_config ~/.gitconfig
else
	printf "\n\n\Git config not found.\n\n"
fi
