#!/bin/bash
# Installs Glow v2.0.0

app_name="glow"
file_type="tar.gz"
proj_dir="$HOME/projects/$app_name"
simlink="$HOME/bin/$app_name"
url="https://github.com/charmbracelet/glow/releases/download/v2.0.0/glow_2.0.0_Linux_x86_64.tar.gz"
checksum=true
linker=true

wget https://github.com/charmbracelet/glow/releases/download/v2.0.0/checksums.txt
versha=$(grep "Linux_x86_64.tar.gz$" checksums.txt | awk '{print $1}')
rm ./checksums.txt

install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"
