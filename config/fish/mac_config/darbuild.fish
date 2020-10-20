function darbuild
  sudo chown -R heywoodlh:admin /nix
  nix-channel --update
  darwin-rebuild switch -I "darwin-config=$HOME/opt/nixos-builds/darwin/darwin-configuration.nix"
end
