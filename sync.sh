#!/bin/bash

# Assume script is run from within the dotfiles directory
dotfiles_dir="$(pwd)"

# Git operations to pull the latest changes
git pull origin master # Change 'main' if your branch is different

echo "Pulled latest dotfiles from GitHub."

# List of dotfiles to sync back
dotfiles=(
  "$HOME/.zshrc"
  "$HOME/.config/hypr/keybindings.conf"
  "$HOME/.config/hypr/userprefs.conf"
  "$HOME/.config/hypr/windowrules.conf"
  "$HOME/.config/nvim" # Full LazyVim configuration
  "$HOME/.config/hyde/themes"
)

# Sync dotfiles back to their original locations
for file in "${dotfiles[@]}"; do
  src="$dotfiles_dir/$(basename $file)"
  if [ -e "$src" ]; then
    cp -r "$src" "$(dirname "$file")"
    echo "Synced $src to $file"
  else
    echo "Warning: $src not found in dotfiles repository"
  fi
done

echo "Dotfiles sync complete."
