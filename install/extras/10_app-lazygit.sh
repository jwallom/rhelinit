#!/bin/bash
# Installs Lazygit v0.44.1

file_name="lazygit_auto.tar.gz"
proj_dir="$HOME/projects/lazygit"
simlink="$HOME/bin/lazygit"

printf "Installing Lazygit...\n\n"

if [ ! -d $proj_dir ]; then
	mkdir -p $proj_dir
fi

cd $proj_dir

wget -O - https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_x86_64.tar.gz > "$file_name"
wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/checksums.txt
shaval=$(sha256sum $file_name | awk '{print $1}')
versha=$(grep "Linux_x86_64" checksums.txt | awk '{print $1}')

if [ $versha == $shaval ]; then
	printf "\n$shaval\n\n"
	rm $proj_dir/checksums.txt
else
	printf "\nIncorrect checksum! Aborting.\n\n"
	exit 5
fi

tar -axf $file_name

if [ -f $simlink ]; then
	rm $simlink
fi

ln -s $proj_dir/lazygit $simlink
rm $file_name
cd -
