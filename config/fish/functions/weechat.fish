function weechat
  mkdir -p ~/.weechat
  docker run --name weechat -it --rm -v ~/.weechat:/weechat/.weechat -e UID=1000 -e GID=1000 jkaberg/weechat
end
