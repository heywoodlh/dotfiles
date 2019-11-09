function thunderbird
  if docker ps -a | grep -q thunderbird
    docker start thunderbird
  else
    docker pull heywoodlh/thunderbird:latest
    docker run -d \
      --name thunderbird
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v $HOME/.config/thunderbird:/home/docker/.thunderbird/ \
      heywoodlh/thunderbird thunderbird
  end
end
