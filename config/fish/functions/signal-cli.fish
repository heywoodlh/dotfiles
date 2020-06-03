function signal-cli
  if ! docker volume ls | grep -q signal_curses
    docker volume create signal_curses
  end
    
  docker run -it --name signal-cli --entrypoint signal-cli -v signal_curses:/home/signal-cli/.local/share/signal-cli --rm heywoodlh/signal-curses $argv
end
