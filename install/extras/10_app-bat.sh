#!/bin/bash
# Installs Bat v0.24.0

file_name="bat_auto.tar.gz"
proj_dir="$HOME/projects/bat"
simlink="$HOME/bin/bat"

printf "Installing bat...\n\n"

if [ ! -d $proj_dir ]; then
	mkdir -p $proj_dir
fi

cd $proj_dir

wget -O - https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-x86_64-unknown-linux-gnu.tar.gz > "$file_name"

tar -axf $file_name
$HOME/bin/linker.sh bat

if [ -f $simlink ]; then
	rm $simlink
fi

ln -s $proj_dir/bat/bat $simlink
rm $file_name
cd -
