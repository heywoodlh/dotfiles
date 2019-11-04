function chrome
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'chrome'
      docker start chrome
    else
      if ! docker volume ls -q | grep -q chrome
        docker volume create chrome
      end

      docker run -d \
        --net host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        -v $HOME/Downloads:/root/Downloads \
        -v $HOME/Pictures:/root/Pictures \
        -v $HOME/Iso:/root/Iso \
        -v chrome:/data \
        -v /dev/shm:/dev/shm \
        -v /etc/hosts:/etc/hosts \
        --device /dev/snd \
        --device /dev/dri \
        --device /dev/video0 \
        --group-add audio \
        --group-add video \
        --name chrome \
	--cap-add SYS_ADMIN \
        jess/chrome --user-data-dir=/data --force-device-scale-factor=1 $argv
    end
  end
end
