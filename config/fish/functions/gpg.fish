function gpg
  mkdir -p ~/.password-store
  mkdir -p ~/.gnupg
  docker run \
    -ti \
    --rm \
    -w /tmp/pass \
    -v (pwd):/tmp/pass \
    -v ~/.password-store:/home/pass/.password-store \
    -v ~/.gnupg:/home/pass/.gnupg \
    heywoodlh/pass gpg $argv
end
