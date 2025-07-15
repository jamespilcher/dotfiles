#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of packages to install
packages=("i3" "i3lock" "i3blocks" "dunst" "maim" "xclip")

# i3: window manager
# i3lock: lockscreen for i3
# i3blocks: navbar utils for i3
# dunst: notifcation daemon (useful for i3!)
# maim: screenshot utility
# xclip: a clipboard manager for X11

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install packages

sudo apt-get update

for package in "${packages[@]}"; do
  if ! command_exists "$package"; then
    echo "Installing $package..."
    sudo apt-get install -y "$package"
  else
    echo "$package is already installed."
  fi
done

# Print a message indicating the installation is complete
echo "Installation of packages is complete."

# Chmod all files in custom_commands folder to chmod +x
# IMPORTANT!
# chmod +x $SCRIPT_DIR/dots/.local/bin/*
chmod -R +x $SCRIPT_DIR/dots/