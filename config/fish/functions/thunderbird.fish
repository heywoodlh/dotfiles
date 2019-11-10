function thunderbird
  if docker ps -a | grep -q thunderbird
    docker start thunderbird
  else
    if ! docker volume ls | grep -q thunderbird_config
      docker volume create thunderbird_config
    end
    docker pull heywoodlh/thunderbird:latest
    docker run -d \
      --net host \
      --name thunderbird \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -u thunderbird \
      -v thunderbird_config:/home/thunderbird/.thunderbird/ \
      heywoodlh/thunderbird thunderbird
  end
end
