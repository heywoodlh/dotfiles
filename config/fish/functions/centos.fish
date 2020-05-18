function centos
  docker run -it --rm --net host --privileged centos $argv
end
