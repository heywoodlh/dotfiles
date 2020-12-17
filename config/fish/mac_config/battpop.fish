function battpop
  set battery_level (pmset -g batt | grep 'InternalBattery' | awk '{print $3 $4}' | sed 's/;/ /g')
  osascript -e "tell app \"System Events\" to display dialog \"BATTERY LEVEL: $battery_level\""
end
