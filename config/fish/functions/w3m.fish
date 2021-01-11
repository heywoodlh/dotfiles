function w3m
  set w3m_bin (which w3m)
  if [ -e ~/.w3m/history ]
    rm ~/.w3m/history
  end
  $w3m_bin $argv
  if [ -e ~/.w3m/history ]
    rm ~/.w3m/history
  end
end
