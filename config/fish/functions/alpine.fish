function alpine
  docker run -it --rm --net host --privileged alpine:latest $argv
end
