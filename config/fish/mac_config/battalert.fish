function battalert
  set threshold 15
  
  set battery_level (pmset -g batt | grep 'InternalBattery' | awk '{print $3}' | sed 's/;/ /g' | tr -d '%')
  
  if [ $battery_level -lt $threshold ]
    osascript -e "display notification \"Battery level less than $threshold%\" with title \"Battery Level\""
  end
end
