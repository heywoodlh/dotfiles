function m4a2mp3
  set input "$argv[1]"
  set output "$argv[2]"

  set error "false"

  if test -z $input; or test -z $output
    set error "true"
  end

  if test $error != "true"
    ffmpeg -i "$input" -c:a libmp3lame -q:a 8 "$output"
  else
    echo "usage: m4a2mp3 input.m4a output.mp3"
  end

end
