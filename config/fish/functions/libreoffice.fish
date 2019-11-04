function libreoffice
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'libreoffice'
      docker start libreoffice
    else
      docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e "DISPLAY=unix$DISPLAY" \
	-v "$HOME/Documents:/root/Documents" \
	-e GDK_SCALE \
	-e GDK_DPI_SCALE \
	--name libreoffice \
	jess/libreoffice $argv
    end
  end
end
