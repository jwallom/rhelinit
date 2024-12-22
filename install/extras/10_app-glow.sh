#!/bin/bash
# Installs Glow v2.0.0

file_name="glow_auto.tar.gz"
proj_dir="$HOME/projects/glow"
simlink="$HOME/bin/glow"

printf "Installing glow...\n\n"

if [ ! -d $proj_dir ]; then
	mkdir -p $proj_dir
fi

cd $proj_dir

wget -O - https://github.com/charmbracelet/glow/releases/download/v2.0.0/glow_2.0.0_Linux_x86_64.tar.gz > "$file_name"
wget https://github.com/charmbracelet/glow/releases/download/v2.0.0/checksums.txt
shaval=$(sha256sum $file_name | awk '{print $1}')
versha=$(grep "Linux_x86_64.tar.gz$" checksums.txt | awk '{print $1}')

if [ $versha == $shaval ]; then
	printf "\n$shaval\n\n"
	rm $proj_dir/checksums.txt
else
	printf "\nIncorrect checksum! Aborting.\n\n"
	exit 5
fi

tar -axf $file_name

$HOME/bin/linker.sh glow

if [ -f $simlink ]; then
	rm $simlink
fi

ln -s $proj_dir/glow/glow $simlink
rm $file_name
cd -
