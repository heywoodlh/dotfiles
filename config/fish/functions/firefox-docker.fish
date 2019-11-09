function firefox-docker
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'firefox'
      docker start firefox
    else
      docker run -d \
	--net host \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "$HOME/.firefox/cache:/root/.cache/mozilla" \
	-v "$HOME/.firefox/mozilla:/root/.mozilla" \
	-v "$HOME/Downloads:/root/Downloads" \
	-v "$HOME/Pictures:/root/Pictures" \
	-v "$HOME/Iso:/root/Iso" \
	-e "DISPLAY=unix$DISPLAY" \
	-e GDK_SCALE \
	-e GDK_DPI_SCALE \
	--device /dev/snd \
	--device /dev/dri \
	--name firefox \
	--shm-size=4G \
	jess/firefox "$argv"
    end
  end
end
