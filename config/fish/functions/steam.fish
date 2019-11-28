function iceweasel
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'steam'
      docker start steam
    else
      docker pull heywoodlh/steam:latest
      docker run -d \
         --net host \
         --name steam \
         -e DISPLAY \
         -e GDK_SCALE \
         -e GDK_DPI_SCALE \
         -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
         -v $HOME/.steam:/home/steam/.steam \
         --device /dev/snd \
         --device /dev/dri \
         --shm-size=4G \
         --group-add audio \
         -u steam \
         heywoodlh/steam
    end
  end
end
