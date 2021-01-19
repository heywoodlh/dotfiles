function gist
  set usage "usage: gist file.txt --private"
  set arguments (count $argv)
  
  set private "false"

  if [ $arguments -gt 0 ]
    set file_name $argv[1]
    set file_exists "true"
    if [ ! -e $file_name ]
      set file_exists "false"
      set file_name "/tmp/$file_name"
    end
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
    if [ $file_exists = "false" ]
      vim $file_name 
    end
    if [ $private != "true" ]
      gh gist create --public $file_name -d $file_name
    else
      gh gist create $file_name -d $file_name
    end
  else
    echo $usage
  end
end
