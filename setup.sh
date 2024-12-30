#!/bin/bash

function continue_prompt {
    printf "Do you want to continue? (y/n)\n"
    read -r response

    response=${response,,}

    if [[ "$response" =~ ^(yes|y)$ ]]; then
        printf "\n\nContinuing...\n"
        return 0
    else
        return 1
    fi
}

function is_rhel {
    local distro
    local version

    distro="$(grep -oP '(?<=^NAME=").*(?=")' /etc/os-release)"
    version="$(grep -oP '(?<=^VERSION_ID=").*(?=")' /etc/os-release)"

    if [ "$distro" == "Red Hat Enterprise Linux" ]; then
        if [[ "$version" =~ ^[0-9]+(\.[0-9]+)*$ ]] && (( $(echo "$version >= 9.4" | bc -l) )); then
            return 0
        else
            printf "WARNING:This should be used on RHEL 9.4+. Current version: %s\n" "$version"
            if continue_prompt; then
                return 0
            else
                printf "Exiting...\n"
                exit 34
            fi
        fi
    else
        return 1
    fi
}

if is_rhel; then
    source ./installer.sh

    #Run stuffs!
    for installer in ./install/*.sh; do source "$installer"; done

    bash ./extras.sh

    touch "$HOME/.rhelinit_complete"

else
    printf "Error: It appears this distribution is not supported. Please ensure you are using RHEL 9.4+\n"
    exit 33
fi
