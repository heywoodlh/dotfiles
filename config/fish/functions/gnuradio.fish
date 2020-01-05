function gnuradio
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'gnuradio'
      docker start gnuradio
    else
      mkdir -p ~/.gnuradio ~/.grc_gnuradio
      docker run -d \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "$HOME"/.gnuradio:/home/gnuradio/.gnuradio \
	-v "$HOME"/.grc_gnuradio:/home/gnuradio/.grc_gnuradio \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
        --group-add audio \
        -v (pwd):/gnuradio \
        -v "$HOME"/Downloads:/home/gnuradio/Downloads \
        -v "$HOME"/Documents:/home/gnuradio/Documents \
	-v /dev/bus/usb:/dev/bus/usb \
        --name gnuradio \
        heywoodlh/gnuradio
    end
  end
end
