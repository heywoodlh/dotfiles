function pass
  mkdir -p ~/.password-store
  mkdir -p ~/.gnupg
  docker run \
    -ti \
    --rm \
    -v ~/.password-store:/root/.password-store \
    -v ~/.gnupg:/root/.gnupg \
    audy/password-store pass $argv
end
