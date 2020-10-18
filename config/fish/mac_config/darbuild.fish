function darbuild
  sudo chown -R heywoodlh:admin /nix
  darwin-rebuild switch -I "darwin-config=$HOME/opt/nixos-builds/darwin/darwin-configuration.nix"
end
