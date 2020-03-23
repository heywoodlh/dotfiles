function relies-on
  for container in $argv:
    set state (docker inspect --format "{{.State.Running}}" $container 2>/dev/null)
    if [[ $state == "false" ]] || [[ $state == "" ]]:
      echo "$container is not running, starting it for you."
      $container
    end
  end
end
