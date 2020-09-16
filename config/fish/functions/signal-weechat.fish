function signal-weechat 
  signald
  mkdir -p ~/.weechat
  docker run -it --rm \
    -v ~/.docker/signald/run:/var/run/signald \
    -v ~/.config/signald:/weechat/.config/signald \
    -v ~/.weechat:/weechat/.weechat \
    heywoodlh/signal-weechat
end
