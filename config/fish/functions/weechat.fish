function weechat
  mkdir -p ~/.weechat
  docker run -it --rm \
    -v ~/.weechat:/weechat/.weechat \
    heywoodlh/weechat
end
