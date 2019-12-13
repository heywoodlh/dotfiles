#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"

NIX_PATH="$HOME/.nix-defexpr/channels"
NIXPKGS_CONFIG="$HOME/.nix/config.nix"
NIXOS_CONFIG="$HOME/.nix/os/config.nix"
NIX_LINK="$HOME/.nix-profile"
NIX_USER_PROFILE_DIR="/nix/var/nix/profiles/per-user/$USER"

sh <(curl https://nixos.org/nix/install) --no-daemon

"$HOME"/.nix-profile/bin/nix-channel --add https://nixos.org/channels/nixpkgs-unstable
"$HOME"/.nix-profile/bin/nix-channel --update

while read PKG
do
	"$HOME"/.nix-profile/bin/nix-env --install "$PKG"
done<nix-pkgs

if uname -a | grep -iq 'linux'
then
	echo "Installing Nix Packages in linux/nix-pkgs"
	while read PKG
	do
		"$HOME"/.nix-profile/bin/nix-env --install "$PKG"
	done<linux/nix-pkgs
	if [[ -f "$HOME/.profile" ]]
	then
		if ! grep -iq 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' "$HOME"/.profile
		then
			echo 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' >> "$HOME"/.profile
		fi
	else 
		echo 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' >> "$HOME"/.profile
	fi
	source "$HOME"/.profile
	echo "Setting up .desktop files"
	sudo cp "$DOTFILES_DIR"/usr/share/applications/*.desktop /usr/share/applications/
	mkdir -p "$HOME"/Documents/Icons && cp $DOTFILES_DIR/icons/* "$HOME"/Documents/Icons
	update-desktop-database
fi

if uname -a | grep -iq 'darwin'
then
	echo "Installing Nix Packages in darwin/nix-pkgs"
	while read PKG
	do
		"$HOME"/.nix-profile/bin/nix-env --install "$PKG"
	done<darwin/nix-pkgs
	echo "Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	cd $DOTFILES_DIR/scripts/darwin/
	brew bundle
	cd $DOTFILES_DIR/scripts
	"$HOME"/.nix/shell/mac-link-apps.sh
fi

echo "$HOME/.nix-profile/bin/fish" | sudo tee -a /etc/shells
sudo chsh -s "$HOME/.nix-profile/bin/fish" "$USER"

if [ ! -f "$HOME"/.bw_session ]
then
        "$HOME"/.nix-profile/bin/bw unlock --raw > "$HOME"/.bw_session
fi

SESSION="$(cat "$HOME"/.bw_session)"

if [ "$SESSION" == "You are not logged in." ]
then
        echo "You are not logged in to Bitwarden."
        "$HOME"/.nix-profile/bin/bw login --raw > "$HOME"/.bw_session
	SESSION="$(cat "$HOME"/.bw_session)"
fi

"$HOME"/.nix-profile/bin/bw sync --session "$SESSION"


"$HOME"/.nix-profile/bin/bw list items --search 'bw-onboarding-script' --session "$(cat "$HOME"/.bw_session)" | "$HOME"/.nix-profile/bin/jq -r '.[].notes' > /tmp/bw-setup.sh
chmod +x /tmp/bw-setup.sh

/tmp/bw-setup.sh
