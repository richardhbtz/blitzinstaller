#!/bin/bash

print_in_color() {
    local color="$1"
    local message="$2"
    case "$color" in
        red) echo -e "\033[31m$message\033[0m";;
        green) echo -e "\033[32m$message\033[0m";;
        yellow) echo -e "\033[33m$message\033[0m";;
        blue) echo -e "\033[34m$message\033[0m";;
        *) echo "$message";;
    esac
}

backup_nvim_config() {
    local timestamp=$(date +"%Y%m%d%H%M%S")
    local backup_dir="$HOME/.config/nvim_backup_$timestamp"
    print_in_color yellow "Backing up current configuration..."
    mv "$HOME/.config/nvim" "$backup_dir"
}

if ! command -v nvim &> /dev/null; then
    print_in_color red "Neovim is not installed. Please install it and try again."
    exit 1
fi

if [ -d "$HOME/.config/nvim" ]; then
    backup_nvim_config
fi

mkdir -p "$HOME/.config/nvim/lua/custom"

print_in_color blue "Installing blitz..."
curl -s -o "$HOME/.config/nvim/init.lua" https://raw.githubusercontent.com/richardhbtz/blitzinstaller/main/init.lua
curl -s -o "$HOME/.config/nvim/lua/custom/blitz.lua" https://raw.githubusercontent.com/richardhbtz/blitzinstaller/main/blitz.lua

if [ $? -eq 0 ]; then
    print_in_color green "Installation complete. Enjoy your new setup!"
else
    print_in_color red "Installation failed. Please try again."
    exit 1
fi

