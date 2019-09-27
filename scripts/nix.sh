#!/usr/bin/env bash

sh <(curl https://nixos.org/nix/install) --daemon

~/.nix-profile/bin/nix-channel --add https://nixos.org/channels/nixpkgs-unstable
~/.nix-profile/bin/nix-channel --update

while read PKG
do
	~/.nix-profile/bin/nix-env --install "$PKG"
done<nix-pkgs

if uname -a | grep -iq 'linux'
then
	echo "Installing Nix Packages in linux/nix-pkgs"
	while read PKG
	do
		~/.nix-profile/bin/nix-env --install "$PKG"
	done<linux/nix-pkgs
	echo "Running Firefox setup script"
	cd linux
	./firefox-config.sh
	cd ..
	if not grep -iq 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' ~/.profile
	then
		echo 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' >> ~/.profile
	fi
fi

if uname -a | grep -iq 'darwin'
then
	echo "Installing Nix Packages in darwin/nix-pkgs"
	while read PKG
	do
		~/.nix-profile/bin/nix-env --install "$PKG"
	done<darwin/nix-pkgs
fi

echo "$HOME/.nix-profile/bin/fish" | sudo tee -a /etc/shells
sudo chsh -s "$HOME/.nix-profile/bin/fish" "$USER"

if [ ! -f ~/.bw_session ]
then
        "$HOME"/.nix-profile/bin/bw unlock --raw > ~/.bw_session
fi

SESSION="$(cat ~/.bw_session)"

if [ "$SESSION" == "You are not logged in." ]
then
        echo "You are not logged in to a Bitwarden instance."
        echo "BW Server URL: "
        read BW_SERVER
        "$HOME"/.nix-profile/bin/bw config server "$BW_SERVER"
        "$HOME"/.nix-profile/bin/bw login --raw > ~/.bw_session
fi

"$HOME"/.nix-profile/bin/bw sync --session "$SESSION"


"$HOME"/.nix-profile/bin/bw list items --search 'bw-onboarding-script' --session "$(cat ~/.bw_session)" | "$HOME"/.nix-profile/bin/jq -r '.[].notes' > /tmp/bw-setup.sh
chmod +x /tmp/bw-setup.sh

/tmp/bw-setup.sh
