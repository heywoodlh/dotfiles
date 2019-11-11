function nix-env
  docker run --rm \
    -v ~/.nix:/home/nix/.nix \
    -v ~/.nix-profile:/home/nix/.nix-profile \
    -v /nix:/nix \
    heywoodlh/nix nix-env $argv
end
