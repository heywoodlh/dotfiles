function tradewars
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'tradewars'
      docker start tradewars
    else
      if ! docker volume ls | grep -q tradewars_config
        docker volume create tradewars_config
      end
      docker pull heywoodlh/tradewars:latest
      docker run -d \
               --net host \
               --name tradewars \
               -e DISPLAY \
               -e GDK_SCALE \
               -e GDK_DPI_SCALE \
               -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
               --shm-size=4G \
               heywoodlh/tradewars
    end
  end
end
