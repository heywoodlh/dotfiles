function steam
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'steam'
      docker start steam
    else
      docker pull heywoodlh/steam:latest
      docker run -d \
        -v /etc/localtime:/etc/localtime:ro \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /var/run/dbus:/var/run/dbus \
        --name steam \
        -e DISPLAY \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v $HOME/.steam:/home/steam/.local/share/Steam \
        --device /dev/snd \
        --group-add audio \
        -u steam \
        heywoodlh/steam
    end
  end
end
