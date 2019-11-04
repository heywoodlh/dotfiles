function opensnitch
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'opensnitch'
      docker start opensnitch opensnitchd
    else
      docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	--net host \
	--cap-add NET_ADMIN \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /var/run/dbus:/var/run/dbus \
	-v /usr/share/dbus-1:/usr/share/dbus-1 \
	-v /var/run/user/(id -u):/var/run/user/(id -u) \
	-e DBUS_SESSION_BUS_ADDRESS \
	-e XAUTHORITY \
	-v "$HOME/.Xauthority:$HOME/.Xauthority" \
	-v /tmp:/tmp \
	--name opensnitchd \
	jess/opensnitchd

	docker run -d \
	  -v /etc/localtime:/etc/localtime:ro \
	  -v /tmp/.X11-unix:/tmp/.X11-unix \
	  -e "DISPLAY=unix$DISPLAY" \
	  -v /usr/share/X11:/usr/share/X11:ro \
	  -v /usr/share/dbus-1:/usr/share/dbus-1 \
	  -v /etc/machine-id:/etc/machine-id:ro \
	  -v /var/run/dbus:/var/run/dbus \
	  -v /var/run/user/(id -u):/var/run/user/(id -u) \
	  -e DBUS_SESSION_BUS_ADDRESS \
	  -e XAUTHORITY \
	  -v "$HOME/.Xauthority:$HOME/.Xauthority" \
	  -e HOME \
	  -e QT_DEVICE_PIXEL_RATIO \
	  -e XDG_RUNTIME_DIR \
	  -v /etc/passwd:/etc/passwd:ro \
	  -v /etc/group:/etc/group:ro \
	  -v /tmp:/tmp \
	  -u (id -u) -w "$HOME" \
	  --net host \
	  --name opensnitch \
	  jess/opensnitch
    end
  end
end
