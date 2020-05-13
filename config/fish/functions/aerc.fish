function aerc
  set EDITOR /usr/bin/vim

  mkdir -p ~/.config/aerc/scripts
  mkdir -p ~/.config/aerc/filters
  mkdir -p ~/.config/aerc/templates
  mkdir -p ~/.config/khard/contacts
  mkdir -p ~/.gnupg
  mkdir -p ~/.password-store
  mkdir -p ~/Documents
  mkdir -p ~/Desktop
  mkdir -p ~/Pictures
  mkdir -p ~/Downloads

  
  docker run -it --rm --name aerc \
    -e EDITOR=$EDITOR \
    -v ~/.config/aerc/filters:/usr/share/aerc/filters \
    -v ~/.config/aerc/templates:/home/aerc/.config/aerc/templates \
    -v ~/.config/aerc/scripts:/home/aerc/.config/aerc/scripts \
    -v ~/.config/khard:/home/aerc/.config/khard \
    -v ~/.password-store:/home/aerc/.password-store \
    -v ~/.gnupg:/home/aerc/.gnupg \
    -v ~/Downloads:/home/aerc/Downloads \
    -v ~/Documents:/home/aerc/Documents \
    -v ~/Pictures:/home/aerc/Pictures \
    -v ~/Desktop:/home/aerc/Desktop \
    -v /etc/hosts:/etc/hosts \
    -v $HOME/.config/aerc:/home/aerc/.config/aerc \
    -e TZ=America/Denver \
    --network host \
    heywoodlh/aerc:latest $argv
end
