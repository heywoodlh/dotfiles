function go
  docker run --rm -it \
  	--pid host \
	-w /tmp/go \
	-v (pwd):/tmp/go \
 	golang:alpine go $argv
end
