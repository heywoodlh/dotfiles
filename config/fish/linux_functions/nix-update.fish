function nix-update
  set workingDir (pwd)
  cd /etc/nixos
  git pull origin master
  sudo nixos-rebuild switch
  cd $workingDir
end
