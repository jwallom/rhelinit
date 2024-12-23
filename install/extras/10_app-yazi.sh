#!/bin/bash
# Installs Yazi

app_name="yazi"  #This is the name of the application. Should be lower case.
file_type="zip"  #Defaults to tar.gz, but is used to determine how to uncompress the installation. "tar.XX" and "zip" are valid
proj_dir="$HOME/projects/$app_name"  #Change if you want installed in a different location
simlink="$HOME/bin/$app_name"  #Change if you want the executable called something different than $app_name
url="https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip"  #URL for the project to get the binaries
checksum=false  #If you want to check the download's checksum, leave true. Requires the versha variable as the sha256sum to validate against
versha="empty"
linker=true #If this package creates a custom folder for each version and you want a consistant path for the symbolic link.

install_software "$app_name" "$file_type" "$proj_dir" "$simlink" "$url" "$checksum" "$versha" "$linker"

#Yazi also has a binary for package management called ya. Lets make sure to make it available too.
if [ -f "$HOME/bin/ya" ]; then
	rm "$HOME/bin/ya"
fi

cd "$proj_dir" || exit 3
ln -s "$(pwd)/$(find "$app_name"/ -type f -name ya -executable -print 2>|/dev/null)" "$HOME/bin/ya"
cd - || exit 3
