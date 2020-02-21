function drobo-utils
  docker run --rm -it --name drobo-utils --privileged -v /dev/bus/usb:/dev/bus/usb heywoodlh/drobo-utils /bin/bash
end
