function wireshark
  if uname -a | grep -iq linux
    if docker ps -a | grep -q 'wireshark'
      docker start wireshark
    else
      docker run -d \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/snd \
        --group-add audio \
        -v (pwd):/wireshark \
        --name wireshark \
        jess/wireshark
    end
  end
end
