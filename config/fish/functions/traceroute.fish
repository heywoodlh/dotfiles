function traceroute
  docker run --rm -it \
    --net host \
    jess/traceroute "$argv"
end
