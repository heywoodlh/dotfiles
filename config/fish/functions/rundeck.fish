function rundeck
  if ! docker volume ls | grep -iq rundeck_db
    docker volume create rundeck_db
  end

  if ! docker volume ls | grep -iq rundeck_config
    docker volume create rundeck_config
  end

  docker run -p 4440:4440 -it --rm --name rundeck -v rundeck_config:/home/rundeck/server/config -v rundeck_db:/home/rundeck/server/data rundeck/rundeck:SNAPSHOT
end
