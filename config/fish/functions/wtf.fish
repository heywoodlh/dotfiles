function wtf
  if pass ls | grep -q openweathermap_api
    set WTF_OWM_API_KEY (pass openweathermap_api)
  end
  mkdir -p ~/.config/wtf/
  docker run --name=wtf --pid host -v ~/Nextcloud/Tasks:/home/wtf/.config/wtf/tasks -v ~/.config/wtf:/home/wtf/.config/wtf -it --rm heywoodlh/wtf --config=/home/wtf/.config/wtf/config.yml 
end
