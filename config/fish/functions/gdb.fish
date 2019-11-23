function gdb
  docker run --rm -it \
  	--pid host \
	-w /tmp/gdb \
	-v (pwd):/tmp/gdb \
 	heywoodlh/gdb $argv
end
