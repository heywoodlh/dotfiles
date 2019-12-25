function virtualbox
  if docker ps -a | grep -q 'virtualbox'
    docker start virtualbox
  else
    
    if test ! -f /opt/virtualbox/provisioned.txt
      docker run -d --privileged --name virtualbox --entrypoint /bin/bash jess/virtualbox
      sudo docker cp virtualbox:/usr/lib/virtualbox /usr/lib
      sudo docker cp virtualbox:/usr/share/virtualbox /usr/share
      sudo /usr/lib/virtualbox/vboxdrv.sh setup
      sudo rm -rf /usr/share/virtualbox /usr/lib/virtualbox
      sudo mkdir -p /opt/virtualbox
      sudo touch /opt/virtualbox/provisioned.txt
      docker rm -f virtualbox
    end
    docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --privileged \
    -v "$HOME/Documents/Virtualbox VMs:/root/Virtualbox VMs" \
    --name virtualbox \
    jess/virtualbox
  end
end
