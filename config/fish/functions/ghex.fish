function ghex
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'ghex'
      docker start ghex
    else
      docker run -d --rm \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        -v $HOME:/home/ghex \
        --name ghex \
        heywoodlh/ghex
    end
  end
end
