function signal
  if docker ps -a | grep -q signal-desktop
    docker start signal-desktop
  else
    if ! docker volume ls | grep -q signal_config
      docker volume create signal_config
    end
    docker pull heywoodlh/signal:latest
    docker run -d \
      --net host \
      --name signal-desktop \
      -e DISPLAY \
      --cap-add SYS_ADM \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v signal_config:/home/signal/.config/Signal/ \
      -v $HOME/Downloads:/home/signal/Downloads \
      -v $HOME/Documents:/home/signal/Documents \
      -v $HOME/Desktop:/home/signal/Desktop \
      --device /dev/snd \
      --device /dev/dri \
      --shm-size=2G \
      --group-add audio \
      -u signal \
      heywoodlh/signal
  end
end
