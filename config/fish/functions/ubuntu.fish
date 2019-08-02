function ubuntu
  docker run -it --rm --net host --privileged ubuntu:18.04 $argv
end
