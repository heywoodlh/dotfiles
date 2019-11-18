if uname -a | grep -iq linux
  function jackit
    docker run --rm -it --name jackit --privileged -v /dev/bus/usb:/dev/bus/usb heywoodlh/jackit
  end
end
