function termboy
  if test -z $argv[1]
    echo "usage: termboy game.rom"
  else
    set game $argv[1]
    docker run --rm -it \
      --device /dev/snd \
      -v (pwd):/tmp/games \
      --name termboy \
      -e DISPLAY \
      -e GDK_SCALE \
      -e GDK_DPI_SCALE \
      --device /dev/snd \
      --device /dev/dri \
      --group-add audio \
      jess/nes "/tmp/games/$game"
  end
end
