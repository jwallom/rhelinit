#!/bin/bash
# Installs FZF v0.57.0

file_name="fzf_auto.tar.gz"
proj_dir="$HOME/projects/fzf"
simlink="$HOME/bin/fzf"

printf "Installing fzf...\n\n"

if [ ! -d $proj_dir ]; then
	mkdir -p $proj_dir
fi

cd $proj_dir

wget -O - https://github.com/junegunn/fzf/releases/download/v0.57.0/fzf-0.57.0-linux_amd64.tar.gz > "$file_name"

tar -axf $file_name

if [ -f $simlink ]; then
	rm $simlink
fi

ln -s $proj_dir/fzf $simlink
rm $file_name
cd -
