function signal-weechat 
  signald
  docker volume signal-weechat
  docker run -it --rm \
    -v ~/.docker/signald/run:/var/run/signald \
    -v ~/.config/signald:/weechat/.config/signald \
    -v signal-weechat:/weechat/.weechat \
    heywoodlh/signal-weechat
end
