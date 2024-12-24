#!/bin/bash

is_sha256() {
    local hash="$1"
    # SHA-256 hash should be exactly 64 characters long and contain only hexadecimal characters
    if [[ ${#hash} -eq 64 && "$hash" =~ ^[0-9a-fA-F]{64}$ ]]; then
        return 0  # Success (is SHA-256)
    else
        return 1  # Failure (not SHA-256)
    fi
}

install_software() {
    local app_name=${1:-"empty"}
    local file_type=${2:-"tar.gz"}
    local proj_dir=${3:-"empty"}
    local simlink=${4:-"empty"}
    local download_url=${5:-"empty"}
    local checksum=${6:-false}
    local versha=${7:-"empty"}
    local linker=${8:-false}

    if [[ "$app_name" == "empty" || "$proj_dir" == "empty" || "$simlink" == "empty" || "$download_url" == "empty" ]]; then
        printf "\nERROR: App configurations problem.\n\n"
        exit 25
    fi

    local file_name="${app_name}_auto.${file_type}"

    printf "Installing %s...\n\n" "$file_name"

    mkdir -p "$proj_dir"
    cd "$proj_dir" || exit 3
    wget -O - "$download_url" > "$file_name"
    
    if $checksum; then
        if is_sha256 "$versha"; then
            shaval=$(sha256sum "$file_name" | awk '{print $1}')
            if [ "$versha" == "$shaval" ]; then
                printf "\nValid checksum: %s\n\n" "$shaval"
            else
                printf "\nincorrect checksum! aborting.\n\n"
                printf "expected: %s\n" "$versha"
                printf "sha256: %s\n" "$shaval"
                exit 5
            fi
        else
            printf "ERROR: Checksum required, but not passed properly.\n"
            exit 4
        fi
    fi

    if [ "$file_type" == "tar.gz" ]; then
        tar -axf "$file_name"
    elif [ "$file_type" == "zip" ]; then
        unzip -fo "$file_name"
    else
        printf "\nERROR: Filetype is invalid: %s\n\n" "$file_type"
        exit 33
    fi

    if [ -f "$simlink" ]; then
	rm "$simlink"
    fi

    if $linker; then
        "$HOME/bin/linker.sh" "$app_name"
        executable="$(pwd)/$(find ${app_name}/ -type f -name ${app_name} -executable -print 2>|/dev/null)"
    else
        executable="$(pwd)/$(find . -type f -name $app_name -executable -print 2>|/dev/null)"
    fi

    ln -s "$executable" "$simlink"
    rm "$file_name"
    cd - || exit 3

}

export -f install_software
export -f is_sha256
