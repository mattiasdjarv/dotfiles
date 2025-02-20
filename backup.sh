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
  # Extract the base name of the file or folder (no parent directories)
  base_name="$(basename "$file")"

  if [ -e "$file" ]; then
    if [ -d "$file" ]; then
      # If it's a directory, copy only its contents
      cp -r "$file"/* "$dotfiles_dir/$base_name/"
      echo "Copied contents of $file to $dotfiles_dir/$base_name"
    else
      # If it's a file, just copy it
      cp "$file" "$dotfiles_dir/$base_name"
      echo "Copied $file to $dotfiles_dir/$base_name"
    fi
  else
    echo "Warning: $file not found"
  fi
done

# Git operations
git add .
git commit -m "Updated dotfiles on $(date)"
git push origin master

echo "Dotfiles backup complete and pushed to GitHub."
