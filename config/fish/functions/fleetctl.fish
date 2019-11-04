function fleetctl
  docker run --rm -it \
  	--pid host \
	--entrypoint fleetctl \
	-v "$HOME/.fleet://.fleet" \
 	jess/fleet $argv
end
