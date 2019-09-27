#!/usr/bin/env bash


FIREFOX_CONF='../../config/firefox/user.js'
FIREFOX_PROFILE="$HOME/.mozilla/firefox/*.default"
FIREFOX_EXTENSIONS="$HOME/.mozilla/extensions"

cp "$FIREFOX_CONF" "$FIREFOX_PROFILE"


BITWARDEN_FIREFOX_EXT='https://addons.mozilla.org/firefox/downloads/file/1711430/bitwarden_free_password_manager-1.41.0-an+fx.xpi?src=dp-btn-primary'
BITWARDEN_XPI_PATH="$HOME/Downloads/bitwarden_password_manager.xpi"
BITWARDEN_EXT_ID='{446900e4-71c2-419f-a6a7-df9c091e268b}'

mkdir -p ~/Downloads/bitwarden/
wget "$BITWARDEN_FIREFOX_EXT" -O ~/Downloads/bitwarden/bitwarden_password_manager.xpi
unzip ~/Downloads/bitwarden/bitwarden_password_manager.xpi
rm ~/Downloads/bitwarden/bitwarden_password_manager.xpi
mv ~/Downloads/bitwarden ~/.mozilla/extensions/"$BITWARDEN_EXT_ID"
