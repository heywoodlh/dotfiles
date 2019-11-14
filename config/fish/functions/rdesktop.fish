function rdesktop
  if docker ps -a | grep -q 'rdesktop'
    docker start rdesktop
  else
    docker run -it --rm \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--name rdesktop \
        jess/rdesktop $argv
  end
end
