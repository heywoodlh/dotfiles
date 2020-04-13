function wtf
  mkdir -p ~/.config/wtf/
  docker run --name=wtf --pid host -v ~/.config/wtf:/config -v ~/.config/wtf/config.yml:/config/config.yml -it -e USER=root --rm wtfutil/wtf
end
