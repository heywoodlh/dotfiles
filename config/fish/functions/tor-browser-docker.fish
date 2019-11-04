function tor-browser-docker
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'tor-browser'
      docker start tor-browser
    else
      if ! docker volume ls -q | grep -q tor_browser
        docker volume create tor_browser
      end
      docker run -d \
        -v tor_browser:/usr/local/bin/Browser/TorBrowser/Data/Browser/profile.default \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --user "$UID" \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
        -v $HOME/Downloads:/usr/local/bin/Browser/Downloads \
        --name tor-browser \
        jess/tor-browser
    end
  end
end
