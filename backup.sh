#!/bin/bash

# Assume script is run from within the dotfiles directory
dotfiles_dir="$(pwd)"

# List of dotfiles to back up
dotfiles=(
  "$HOME/.zshrc"
  "$HOME/.config/hypr/keybindings.conf"
  "$HOME/.config/hypr/userprefs.conf"
  "$HOME/.config/hypr/windowrules.conf"
  "$HOME/.config/nvim" # Full LazyVim configuration
  "$HOME/.config/hyde/themes"

)

# Copy dotfiles to the repository folder
for file in "${dotfiles[@]}"; do
  if [ -f "$file" ] || [ -d "$file" ]; then
    dest="$dotfiles_dir/$(basename $file)"
    cp -r "$file" "$dest"
    echo "Copied $file to $dest"
  else
    echo "Warning: $file not found"
  fi
done
