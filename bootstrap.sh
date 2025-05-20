#!/bin/bash
set -e

# dotfiles local path
DOTFILES_DIR="$HOME/dotfiles"

# clone repo (if don't already exist)
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repo..."
  git clone git@github.com:NonoTheLion/dotfiles.git "$DOTFILES_DIR"
fi

# update repo
echo "Updating dotfiles repo..."
git -C "$DOTFILES_DIR" pull

# launch playbook.yml
echo "Running Ansible playbook..."
ansible-playbook "$DOTFILES_DIR/playbook.yml" --ask-become-pass

echo "Done!"

