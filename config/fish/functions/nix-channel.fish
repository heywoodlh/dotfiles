function nix-channel
  docker run --rm \
    -v ~/.nix:/home/nix/.nix \
    -v ~/.nix-profile:/home/nix/.nix-profile \
    -u nix \
    -v /nix:/nix \
    heywoodlh/nix nix-channel $argv
end
