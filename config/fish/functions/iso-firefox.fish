function iso-firefox
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'iso-firefox'
      docker start iso-firefox
    else
      if ! docker volume ls | grep -q iso-firefox_config
        docker volume create iso-firefox_config
      end
      docker pull heywoodlh/sandbox:latest
      docker run -d \
         --net host \
         --name iso-firefox \
         -e DISPLAY \
         -e GDK_SCALE \
         -e GDK_DPI_SCALE \
         -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
         --device /dev/snd \
         --device /dev/dri \
         --shm-size=4G \
         --group-add audio \
         -e MOZ_USE_XINPUT2=1 \
         -v /etc/localtime:/etc/localtime \
         -u sandbox \
         heywoodlh/sandbox
    end
  end
end
