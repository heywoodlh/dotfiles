#!/usr/bin/env bash

PWD="$(pwd)"
cd "$HOME"
NEW_PATH='"$HOME"/bin'
mkdir -p "$NEW_PATH"
echo PATH="$PATH":"$NEW_PATH":"$HOME"/.local/bin >> "$HOME"/.profile


BW_CLI='https://vault.bitwarden.com/download/?app=cli&platform=linux'
JQ='https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64'


wget "$BW_CLI" -O "$HOME"/bin/master.zip
unzip "$HOME"/bin/master.zip -d "$HOME"/bin
chmod +x "$HOME"/bin/bw
rm "$HOME"/bin/master.zip

wget "$JQ" -O "$HOME"/bin/jq
chmod +x "$HOME"/bin/jq

# https://www.dangtrinh.com/2014/02/xfce-410-add-shortcut-keys-by-command.html
xfconf-query --channel xfce4-keyboard-shortcuts --property "/commands/custom/Super_L" --create --type string --set "xfce4-popup-applicationsmenu"

SHORTCUT_FILE='"$HOME"/.dotfiles/scripts/tens/xfce4-keyboard-shortcuts.xml'
SHORTCUT_FILE_DEST='"$HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml'

cp "$SHORTCUT_FILE" "$SHORTCUT_FILE_DEST"


echo "CommandLoginShell=TRUE" >> "$HOME"/.config/xfce4/terminal/terminalrc


echo 'if [[ -f "$HOME"/.bw_session ]]' >> "$HOME"/.profile
echo 'then' >> "$HOME"/.profile
echo '    BW_SESSION="$(cat "$HOME"/.bw_session)"' >> "$HOME"/.profile
echo 'fi' >> "$HOME"/.profile



cd "$PWD"
