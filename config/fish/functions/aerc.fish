function aerc
  mkdir -p $HOME/.config/aerc
  docker run -it --rm -v $HOME/.config/aerc:/home/aerc/.config/aerc --net host heywoodlh/aerc:latest
end
