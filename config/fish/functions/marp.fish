function marp
  docker run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli $argv
end
