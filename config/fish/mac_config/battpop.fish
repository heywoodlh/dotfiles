function battpop
  set battery_level (pmset -g batt | grep 'InternalBattery' | awk '{print $3 $4}' | sed 's/;/ /g')
  osascript -e "display notification \"$battery_level\" with title \"Battery Level\""
end
