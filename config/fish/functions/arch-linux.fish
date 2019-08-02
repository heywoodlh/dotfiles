function arch-linux
  docker run -it --rm --net host --privileged archlinux/base $argv
end
