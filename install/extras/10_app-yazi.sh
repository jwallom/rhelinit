#!/bin/bash
# Installs Yazi

file_name="yazi_auto.tar.gz"
proj_dir="$HOME/projects/yazi"
simlink="$HOME/bin/yazi"

printf "Installing yazi...\n\n"

if [ ! -d $proj_dir ]; then
	mkdir -p $proj_dir
fi

cd $proj_dir

wget -O - https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip > "$file_name"

unzip -fo $file_name

$HOME/bin/linker.sh yazi

if [ -f $simlink ]; then
	rm $simlink
	rm $HOME/bin/ya
fi

ln -s $proj_dir/yazi/yazi $simlink
ln -s $proj_dir/yazi/ya $HOME/bin/ya
rm $file_name
cd -
