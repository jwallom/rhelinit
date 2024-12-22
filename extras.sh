#!/bin/bash

# Function to display the menu and get user selection
select_items() {
    local items=("$@")
    local selected=()

    printf "Select additional packages to install by number (separate multiple selections with spaces):\n"
    for i in "${!items[@]}"; do
        printf "%d) %s\n" "$((i+1))" "${items[i]}"
    done

    read -r selections
    for selection in $selections; do
        if [[ $selection =~ ^[0-9]+$ ]] && [ "$selection" -le "${#items[@]}" ] && [ "$selection" -gt 0 ]; then
            selected+=("${items[$((selection-1))]}")
        fi
    done

    printf "Selected items: ${selected[*]}\n"
    printf "Installing selected pachages...\n"
    for item in "${selected[@]}"; do
        # Example action, replace with your actual command
        printf "Installing: %s\n" "$item"
        bash ./install/extras/10_app-$item.sh
    done
}

# Example list of items
items=("fzf" "bat" "lazygit" "glow" "yazi")

# Call the function with the list of items
select_items "${items[@]}"
