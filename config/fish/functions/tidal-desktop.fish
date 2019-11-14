function tidal-desktop-docker
  if uname -a | grep -iq linux
    if test ! -f /etc/sysctl.d/00-local-userns.conf
      sudo -v
      echo 'kernel.unprivileged_userns_clone=1' | sudo tee /etc/sysctl.d/00-local-userns.conf
      sudo systemctl restart procps.service
    end
    if docker ps -a | grep -q 'tidal-desktop'
      docker start tidal-desktop
    else
      docker run -d \
	--net host \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "$HOME/.tidal-desktop/cache:/root/.cache/mozilla" \
	-v "$HOME/.tidal-desktop/mozilla:/root/.mozilla" \
	-v "$HOME/Downloads:/root/Downloads" \
	-v "$HOME/Pictures:/root/Pictures" \
	-v "$HOME/Iso:/root/Iso" \
	-e DISPLAY \
	-e GDK_SCALE \
	-e GDK_DPI_SCALE \
	--device /dev/snd \
	--device /dev/dri \
        --group-add audio \
	--name tidal-desktop \
	--shm-size=4G \
        --cap-add=SYS_ADMIN \
	heywoodlh/tidal-desktop "$argv"
    end
  end
end
