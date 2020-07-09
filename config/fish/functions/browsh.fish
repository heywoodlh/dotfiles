function browsh
  if test ! -f $HOME/.config/browsh/config.toml
    echo 'config.toml missing, downloading default...'
    mkdir -p $HOME/.config/browsh
    curl 'https://gist.githubusercontent.com/heywoodlh/0c6ccf9917ef30f610bb6eb9071f0f2b/raw/6c607516191211540a4d0a43972d90c0119385e5/config.toml' -o $HOME/.config/browsh/config.toml
  end
  docker run -v $HOME/.config/browsh/config.toml:/app/.config/browsh/config.toml --rm -it browsh/browsh /app/browsh $argv
end
