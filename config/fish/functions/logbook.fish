function logbook
  set target "$HOME/Sync/logbook"
  
  set year (date +%Y)
  set month (date +%h)
  set day (date +%d)
  set time (date +%H:%M:%S)

  mkdir -p "$target/$year/$month"
  set file "$target/$year/$month/$day.txt"
  
  printf "$time\n" >> $file

  vim + $file

  printf "\n" >> $file
end
