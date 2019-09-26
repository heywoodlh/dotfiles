#!/usr/bin/env bash

sh <(curl https://nixos.org/nix/install) --no-daemon

~/.nix-profile/bin/nix-channel --add https://nixos.org/channels/nixpkgs-unstable
~/.nix-profile/bin/nix-channel --update
