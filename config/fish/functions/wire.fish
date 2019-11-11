function wire
  if docker ps -a | grep -q wire-desktop
    docker start wire-desktop
  else
    if ! docker volume ls | grep -q wire_config
      docker volume create wire_config
    end
    docker pull heywoodlh/wire:latest
    docker run -d \
      --net host \
      --name wire-desktop \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v wire_config:/home/wire/.config/Wire/ \
      -v $HOME/Downloads:/home/wire/Downloads \
      -v $HOME/Documents:/home/wire/Documents \
      -v $HOME/Desktop:/home/wire/Desktop \
      --device /dev/snd \
      --device /dev/dri \
      --shm-size=2G \
      --group-add audio \
      -u wire \
      heywoodlh/wire
  end
end
