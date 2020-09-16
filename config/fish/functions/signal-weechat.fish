function signal-weechat 
  signald
  if ! docker volume ls | grep -iq signal_weechat
    docker volume create signal_weechat
  end
  docker run -it --rm \
    -v ~/.docker/signald/run:/var/run/signald \
    -v ~/.config/signald:/weechat/.config/signald \
    -v signal_weechat:/weechat/.weechat \
    heywoodlh/signal-weechat
end
