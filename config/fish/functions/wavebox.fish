function wavebox
  if docker ps -a | grep -q wavebox
    docker start wavebox
  else
    docker pull heywoodlh/wavebox:latest
    docker run -d \
      --net host \
      --name wavebox \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v $HOME/.config/wavebox:/home/wavebox/.local/share/wavebox/ \
      heywoodlh/wavebox
  end
end
