function ansible
  docker run --rm \
 	-it \
        -v $PWD:/root \
 	-v $HOME/.ssh:/root/.ssh:ro \
	-w /root \
 	jess/ansible $argv
end
