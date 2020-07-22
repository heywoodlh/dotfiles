function links
  set architecture (uname -m)
  if [ $architecture = "x86_64" ]
    docker run heywoodlh/links $argv
  else
    docker run heywoodlh/links:arm $argv
  end
end
