function m4a2mp3
  if [ -z $argv[1] ]
    set error "true"
  end
  if [ -z $argv[2] ]
    set error "true"
  end
  if [ $error != "true" ]
    ffmpeg -i $argv[1] -c:a libmp3lame -q:a 8 $argv[2]
  else
    echo "usage: m4a2mp3 input.m4a output.mp3"
  end
end
