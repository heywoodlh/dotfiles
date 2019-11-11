function nix
  docker run --rm -v ~/.nix:/home/nix/.nix \
    -v ~/.nix-profile:/home/nix/.nix-profile \
    -u nix \
    -v /nix:/nix \
    heywoodlh/nix /home/nix/.nix-profile/bin/nix $argv
end
