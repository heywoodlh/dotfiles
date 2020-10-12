function nix-update
  set workingDir (pwd)
  cd /etc/nixos
  git pull origin master
  sudo nixos-rebuild switch
  sudo nix-collect-garbage --delete-older-than 30d
  cd $workingDir
end
