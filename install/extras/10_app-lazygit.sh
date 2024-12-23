#!/bin/bash
# Installs Lazygit v0.44.1

app_name="lazygit"  #This is the name of the application. Should be lower case.
file_type="tar.gz"  #Defaults to tar.gz, but is used to determine how to uncompress the installation. "tar.XX" and "zip" are valid
proj_dir="$HOME/projects/$app_name"  #Change if you want installed in a different location
simlink="$HOME/bin/$app_name"  #Change if you want the executable called something different than $app_name
url="https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_x86_64.tar.gz"  #URL for the project to get the binaries
checksum=true  #If you want to check the download's checksum, leave true. Requires the versha variable as the sha256sum to validate against
versha="empty"
linker=false #If this package creates a custom folder for each version and you want a consistant path for the symbolic link.

wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/checksums.txt
versha=$(grep "Linux_x86_64" checksums.txt | awk '{print $1}')
rm ./checksums.txt

install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"
