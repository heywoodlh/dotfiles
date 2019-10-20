function marp
  docker run --rm --user (id -u):(id -g) -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli $argv
end
