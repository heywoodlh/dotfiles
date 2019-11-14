function remmina
  if docker ps -a | grep -q 'remmina'
    docker start remmina
  else
    docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
        --net host \
	-e DISPLAY \
	-v $HOME/.remmina:/root/.remmina \
	--name remmina \
	heywoodlh/remmina
  end
end
