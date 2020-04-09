function aerc
  mkdir -p $HOME/.config/aerc
  docker run -it --rm --name aerc -v $HOME/.config/aerc:/home/aerc/.config/aerc -e TZ=America/Denver --network host heywoodlh/aerc:latest $argv
end
