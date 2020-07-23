function slack-term
  mkdir -p ~/.config/slack-term/ && touch ~/.config/slack-term/config
  docker run --name=slack-term -v ~/.config/slack-term/config:/config -it --rm erroneousboat/slack-term 
end
