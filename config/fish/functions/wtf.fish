function wtf
  mkdir -p ~/.config/wtf/
  docker run --name=wtf --pid host -v ~/.config/wtf:/home/wtf/.config/wtf -it --rm heywoodlh/wtf --config=/home/wtf/.config/wtf/config.yml 
end
