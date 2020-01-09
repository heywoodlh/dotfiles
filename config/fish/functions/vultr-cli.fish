function vultr-cli
  if set -q VULTR_API_KEY
    docker run --rm -it -e VULTR_API_KEY="$VULTR_API_KEY" heywoodlh/vultr-cli $argv
  else
    echo "Please enter Vultr API Key:"
    read VULTR_API_KEY
    docker run --rm -it -e VULTR_API_KEY="$VULTR_API_KEY" heywoodlh/vultr-cli $argv
  end
end
