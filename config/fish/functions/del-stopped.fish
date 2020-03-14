function del-stopped
  set name $argv[1]
  set state (docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

  if [[ $state == "false" ]]:
    docker rm $name
  end
end
