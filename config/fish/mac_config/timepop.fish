function timepop
  set cur_date (date "+%H:%M:%S -- %D")
  osascript -e "display notification \"$cur_date\" with title \"Time\""
end
