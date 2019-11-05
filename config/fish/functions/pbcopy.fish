if uname -a | grep -qi linux
  function pbcopy
    xclip -selection clipboard
  end
end
