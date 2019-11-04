function tor-browser-docker
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'tor-browser'
      docker start tor-browser
    else
      docker run -d \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
        -v $HOME/Downloads:/root/Downloads \
        --name tor-browser \
        jess/tor-browser
    end
  end
end
