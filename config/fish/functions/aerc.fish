function aerc
  mkdir -p ~/.config/aerc/scripts
  mkdir -p ~/.config/khard/contacts
  mkdir -p ~/.gnupg
  mkdir -p ~/.password-store
  set EDITOR /usr/bin/vim
  docker run -it --rm --name aerc -e EDITOR=$EDITOR -v ~/.config/aerc/scripts:/home/aerc/.config/aerc/scripts -v ~/.config/khard:/home/aerc/.config/khard -v ~/.password-store:/home/aerc/.password-store -v ~/.gnupg:/home/aerc/.gnupg -v $HOME/.config/aerc:/home/aerc/.config/aerc -e TZ=America/Denver --network host heywoodlh/aerc:latest $argv
end
