#!/bin/bash
# Installs Bat v0.24.0

app_name="bat"  #This is the name of the application. Should be lower case.
file_type="tar.gz"  #Defaults to tar.gz, but is used to determine how to uncompress the installation. "tar.XX" and "zip" are valid
proj_dir="$HOME/projects/$app_name"  #Change if you want installed in a different location
simlink="$HOME/bin/$app_name"  #Change if you want the executable called something different than $app_name
url="https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"  #URL for the project to get the binaries
checksum=false  #If you want to check the download's checksum, leave true. Requires the versha variable as the sha256sum to validate against
versha="empty"
linker=true #If this package creates a custom folder for each version and you want a consistant path for the symbolic link.

# Now we can call the installer function. Requires 8 things
install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"
