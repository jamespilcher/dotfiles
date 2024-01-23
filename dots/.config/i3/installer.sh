#!/bin/bash

# List of packages to install
packages=("i3 i3lock i3blocks dunst")

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
chmod +x ~/.config/i3/custom_scripts/*
