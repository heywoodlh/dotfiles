function wire
  if docker ps -a | grep -q wire
    docker start wire
  else
    docker pull heywoodlh/wire:latest
    docker run -d \
      --net host \
      --name wire \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v $HOME/.config/wire:/home/wire/.config/Wire/ \
      -v $HOME/Downloads:/home/wire/Downloads \
      -v $HOME/Documents:/home/wire/Documents \
      -v $HOME/Desktop:/home/wire/Desktop \
      heywoodlh/wire
  end
end
