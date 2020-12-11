function gist
  set usage "usage: gist file.txt --private"
  set arguments (count $argv)
  
  if [ $arguments -gt 0 ]
    set file_name $argv[1]
    if [ $arguments -gt 1 ]
      if echo $argv | grep -q '\-\-private'
        set private "true"
      else
        set run_error "true"
      end
    end
  else if [ $arguments -gt 2 ]
    set run_error "true"
  else
    set run_error "true"
  end
 
  
  if [ -z "$run_error" ]
    vim /tmp/$file_name 
    if [ $private != "true" ]
      gh gist create --public /tmp/$file_name -d $file_name
    else
      gh gist create /tmp/$file_name -d $file_name
    end
    rm /tmp/$file_name
  else
    echo $usage
  end
end
