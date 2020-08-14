function netscan
  docker run -it --rm --net host heywoodlh/red /opt/red-scripts/netscan.sh $argv
end
