function chrome
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'chrome'
      docker start chrome
    else
      if docker volume ls | grep -q 'chrome_data'
        docker volume create chrome_data
      end
      docker run -d \
        --net host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY \
        -v $HOME/Downloads:/root/Downloads \
        -v $HOME/Pictures:/root/Pictures \
        -v $HOME/Iso:/root/Iso \
        -v chrome_data:/data \
        -v /dev/shm:/dev/shm \
        -v /etc/hosts:/etc/hosts \
        --device /dev/snd \
        --group-add audio \
        --device /dev/dri \
        --name chrome \
	--cap-add SYS_ADMIN \
        heywoodlh/chrome --user-data-dir=/data --force-device-scale-factor=1 $argv
    end
  end
end
