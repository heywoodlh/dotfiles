pulseaudio(){
  del-stopped pulseaudio

  docker run -d \
  -v /etc/localtime:/etc/localtime:ro \
  --device /dev/snd \
  -p 4713:4713 \
  --restart always \
  --group-add audio \
  --name pulseaudio \
  jess/pulseaudio
}
