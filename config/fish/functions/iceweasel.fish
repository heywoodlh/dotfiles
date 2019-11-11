function iceweasel
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'iceweasel'
      docker start iceweasel
    else
      if ! docker volume ls | grep -q iceweasel_config
        docker volume create iceweasel_config
      end
      docker pull heywoodlh/iceweasel:latest
      docker run -d \
         --net host \
         --name iceweasel \
         -e DISPLAY \
         -e GDK_SCALE \
         -e GDK_DPI_SCALE \
         -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
         -v iceweasel_config:/home/iceweasel/.mozilla/firefox/default.profile/ \
         -v $HOME/Downloads:/home/iceweasel/Downloads \
         -v $HOME/Documents:/home/iceweasel/Documents \
         -v $HOME/Desktop:/home/iceweasel/Desktop \
         --device /dev/snd \
         --device /dev/dri \
         --shm-size=4G \
         --group-add audio \
         -u iceweasel \
         heywoodlh/iceweasel
    end
  end
end
