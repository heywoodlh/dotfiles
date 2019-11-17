if uname -a | grep -iq linux
  function keystroke
    docker run --rm -it --name keystroke --privileged -v /dev/bus/usb:/dev/bus/usb heywoodlh/keystroke
  end
end
