function tor-browser-docker
    docker run -d \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
        -v $HOME/Downloads:/root/Downloads \
        --name tor-browser \
        jess/tor-browser
end
