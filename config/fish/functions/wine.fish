function wine
  docker run -it --rm \
         -v ~/.wine:/home/wine/.wine \
         --net host \
         -e "DISPLAY=unix$DISPLAY" \
         -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
         -e GDK_SCALE \
         -e GDK_DPI_SCALE \
         --shm-size=4G \
         --device /dev/snd \
         --device /dev/dri \
         --shm-size=4G \
         --group-add audio \
         -v (pwd):/home/wine \
         heywoodlh/wine wine $argv
end
