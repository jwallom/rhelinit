#!/bin/bash
# Installs FZF v0.57.0

app_name="fzf"  #This is the name of the application. Should be lower case.
file_type="tar.gz"  #Defaults to tar.gz, but is used to determine how to uncompress the installation. "tar.XX" and "zip" are valid
proj_dir="$HOME/projects/$app_name"  #Change if you want installed in a different location
simlink="$HOME/bin/$app_name"  #Change if you want the executable called something different than $app_name
url="https://github.com/junegunn/fzf/releases/download/v0.57.0/fzf-0.57.0-linux_amd64.tar.gz"  #URL for the project to get the binaries
checksum=false  #If you want to check the download's checksum, leave true. Requires the versha variable as the sha256sum to validate against
versha="empty"
linker=false #If this package creates a custom folder for each version and you want a consistant path for the symbolic link.

install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"
