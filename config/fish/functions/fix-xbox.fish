function fix-xbox
  sudo sh -c 'echo 1 > /sys/module/bluetooth/parameters/disable_ertm'
end
