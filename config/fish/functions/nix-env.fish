function nix-env
  docker run --rm \
    -v ~/.nix:/home/nix/.nix \
    -v ~/.nix-profile:/home/nix/.nix-profile \
    -v /nix:/nix \
    -u nix \
    heywoodlh/nix /home/nix/.nix-profile/bin/nix-env $argv
end
