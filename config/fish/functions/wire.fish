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
      -v $HOME/.config/wire:/root/.config/Wire/ \
      -v $HOME/Downloads:/root/Downloads \
      -v $HOME/Documents:/root/Documents \
      -v $HOME/Desktop:/root/Desktop \
      heywoodlh/wire
  end
end
