function wifi-toggle
  set output (wifi info) 

  if echo $output | grep -iq 'AirPort: Off'
    wifi on
  else
    wifi off
  end
end
