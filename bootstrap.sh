#!/bin/bash
set -e

# Chemin vers ton repo dotfiles local
DOTFILES_DIR="$HOME/dotfiles"

# Si le dossier dotfiles n'existe pas, on le clone
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repo..."
  git clone git@github.com:NonoTheLion/dotfiles.git "$DOTFILES_DIR"
fi

# Mise à jour du repo dotfiles
echo "Updating dotfiles repo..."
git -C "$DOTFILES_DIR" pull

# Lancer le playbook Ansible en tant qu'utilisateur normal
echo "Running Ansible playbook..."
ansible-playbook "$DOTFILES_DIR/playbook.yml" --ask-become-pass

echo "Done!"

