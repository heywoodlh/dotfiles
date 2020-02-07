function duplicati
  docker volume create duplicati
  docker run -d --name=duplicati --restart=unless-stopped -v duplicati:/data -p 8200:8200 -v $HOME:$HOME duplicati/duplicati &&\
    echo 'duplicati running on http://localhost:8200'
end
