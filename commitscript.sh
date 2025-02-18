#!/bin/bash
SETTINGS_DIR="$HOME/.vscode-settings/"
mkdir -p "$SETTINGS_DIR"
cp "$HOME/.config/Code/User/keybindings.json" "$SETTINGS_DIR"
cp "$HOME/.config/Code/User/settings.json" "$SETTINGS_DIR"
cd "$SETTINGS_DIR" || exit

code --list-extensions | xargs -L 1 echo code --install-extension >install_extensions.sh

git add .
git commit -m "Updated settings on $(date '+%Y-%m-%d %H:%M:%S')"
git push
