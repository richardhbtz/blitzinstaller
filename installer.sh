#!/bin/bash

# Function to print messages in color
print_in_color() {
    local color="$1"
    local message="$2"
    case "$color" in
        red) echo "\033[31m$message\033[0m";;
        green) echo "\033[32m$message\033[0m";;
        yellow) echo "\033[33m$message\033[0m";;
        blue) echo "\033[34m$message\033[0m";;
        *) echo "$message";;
    esac
}

# Function to backup existing nvim configuration
backup_nvim_config() {
    local timestamp=$(date +"%Y%m%d%H%M%S")
    local backup_dir="$HOME/.config/nvim_backup_$timestamp"
    print_in_color yellow "Backing up current nvim configuration to $backup_dir"
    mv "$HOME/.config/nvim" "$backup_dir"
}

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    print_in_color red "nvim is not installed. Please install nvim and try again."
    exit 1
fi

# Check if there's an existing nvim configuration
if [ -d "$HOME/.config/nvim" ]; then
    read -p "An existing nvim configuration was found. Do you want to back it up? (y/n): " choice
    case "$choice" in
        y|Y ) backup_nvim_config;;
        n|N ) print_in_color yellow "Skipping backup.";;
        * ) print_in_color red "Invalid choice. Exiting."; exit 1;;
    esac
fi

# Create nvim config directory if it doesn't exist
mkdir -p "$HOME/.config/nvim"

# Download the new init.lua
print_in_color blue "Downloading the new init.lua from https://raw.githubusercontent.com/richardhbtz/blitzinstaller/main/init.lua"
curl -o "$HOME/.config/nvim/init.lua" https://raw.githubusercontent.com/richardhbtz/blitzinstaller/main/init.lua

if [ $? -eq 0 ]; then
    print_in_color green "Installation complete. Enjoy your new nvim setup!"
else
    print_in_color red "Failed to download init.lua. Please check the URL and try again."
fi

