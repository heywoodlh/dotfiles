function signald
  mkdir -p ~/.config/signald
  mkdir -p ~/.docker/signald/gradle
  mkdir -p ~/.docker/signald/run
  if docker ps | awk '{print $NF}' | grep -iq signald
    set running "true"
  else if docker ps -a | awk '{print $NF}' | grep -iq signald
    docker start signald 2>/dev/null
  else
    docker run -d --name=signald \
      -v ~/.docker/signald/gradle:/home/gradle \
      -v ~/.docker/signald/run:/var/run/signald \
      -v ~/.config/signald:/home/gradle/.config/signald \
      --restart=unless-stopped \
      heywoodlh/signald
  end
end
