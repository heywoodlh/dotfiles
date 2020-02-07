function shodan
  if test ! -e ~/.shodan/api_key
    mkdir -p ~/.shodan/
  end
  docker run --rm -it -v ~/.shodan:/home/shodan/.shodan heywoodlh/shodan-cli $argv
end
