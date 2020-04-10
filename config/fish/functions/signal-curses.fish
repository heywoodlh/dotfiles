if uname -a | grep -iq linux
  function signal-curses
    if ! docker volume ls | grep -q signal_curses
      docker volume create signal_curses
    end
    
    set DBUS_ADDR=(echo "$DBUS_SESSION_BUS_ADDRESS" | cut -d "=" -f2)
    docker run -it --name signal-curses --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -v signal_curses:/home/signal-curses/.local/share/signal-cli -v /etc/machine-id:/etc/machine-id -v /etc/hostname:/etc/hostname -v "$DBUS_ADDR":"$DBUS_ADDR" --security-opt apparmor=unconfined --rm heywoodlh/signal-curses $argv
  end
end
