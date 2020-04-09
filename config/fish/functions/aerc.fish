function aerc
  mkdir -p $HOME/.config/aerc
  set EDITOR /usr/bin/vim
  docker run -it --rm --name aerc -e EDITOR=$EDITOR -v $HOME/.config/aerc:/home/aerc/.config/aerc -e TZ=America/Denver --network host heywoodlh/aerc:latest $argv
end
