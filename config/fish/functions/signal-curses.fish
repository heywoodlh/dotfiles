if uname -a | grep -iq linux
  function signal-curses
    if ! docker volume ls | grep -q signal_curses
      docker volume create signal_curses
    end
    
    docker run -it --name signal-curses --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -v signal_curses:/home/signal-curses/.local/share/signal-cli -v /etc/machine-id:/etc/machine-id -v /etc/hostname:/etc/hostname -v /run/user/1000/bus:/run/user/1000/bus --security-opt apparmor=unconfined --rm heywoodlh/signal-curses -u +14358510830
  end
end
