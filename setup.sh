#!/bin/bash

# Bring in needed tools
source ./tools/bash_functions.sh

# Configure system if RHEL
if is_rhel; then
   
    # Check to see if install has run before.
    # If it has, prompt user.
    if [ -f "$HOME/.rhelinit_complete" ]; then
        printf "It appears this tool has already been run. Continue to upgrade application.\n"
        printf "INFO:Remove ~/.rhelinit_complete to fully reconfigure. Exiting.\n"
        if  ! continue_prompt; then
            printf "INFO:Remove ~/.rhelinit_complete to fully reconfigure. Exiting.\n"
            exit 33
        fi
    fi
    
    # Run setup scripts from ./install/*.sh
    # shellcheck source=/dev/null
    for installer in ./install/*.sh; do source "$installer"; done

    # Prompt for additional apps and install/upgrade them
    bash ./extras.sh

    # We made it to the end. Set a file to let us know setup completed
    touch "$HOME/.rhelinit_complete"

else
    # Not a RHEL machine. Let's stop.
    printf "Error: It appears this distribution is not supported. Please ensure you are using RHEL 9.4+\n"
    exit 33
fi
