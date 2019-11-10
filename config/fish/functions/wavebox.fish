function wavebox
  if docker ps -a | grep -q wavebox
    docker start wavebox
  else
    if ! docker volume ls | grep -q wavebox_config
      docker volume create wavebox_config
    end
    docker pull heywoodlh/wavebox:latest
    docker run -d \
      --net host \
      --name wavebox \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v $HOME/.config/wavebox:/home/wavebox/.local/share/wavebox/ \
      -v $HOME/Downloads:/home/wavebox/Downloads \
      -v $HOME/Documents:/home/wavebox/Documents \
      -v $HOME/Desktop:/home/wavebox/Desktop \
      --device /dev/snd \
      --device /dev/dri \
      --shm-size=4G \
      -u wavebox \
      heywoodlh/wavebox
  end
end
