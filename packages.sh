#!/bin/bash

# List of packages to check and install
packages=(
  "zoxide"
  "neovim"
)

# Function to check if a package is installed
is_installed() {
  pacman -Qs --color always "$1" &>/dev/null
}

# Function to install a package using pacman or yay
install_package() {
  if is_installed "$1"; then
    echo "Package $1 is already installed."
  else
    echo "Installing package $1..."
    if pacman -Ss "$1" &>/dev/null; then
      sudo pacman -S --noconfirm "$1"
    else
      yay -S --noconfirm "$1"
    fi
  fi
}

# Install packages
for package in "${packages[@]}"; do
  install_package "$package"
done
