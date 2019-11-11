function docker-sync
  curl 'https://raw.githubusercontent.com/heywoodlh/.dotfiles/master/config/docker-images.txt' -o /tmp/docker-images.txt
  while read docker_image
    docker pull $docker_image
  end< /tmp/docker-images.txt
end
