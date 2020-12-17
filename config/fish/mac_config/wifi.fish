if command -v osx-wifi-cli > /dev/null
  function wifi
    osx-wifi-cli $argv
  end
else
  npm install -g osx-wifi-cli
end
