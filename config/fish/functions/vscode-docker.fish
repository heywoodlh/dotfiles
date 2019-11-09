function vscode-docker
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'vscode'
      docker start vscode
    else
      docker run -d \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
	-v $HOME/git:/home/user/git \
        --name vscode \
        jess/vscode
    end
  end
end
