function ssh-socks
  set sshUri $argv[1]
  if test -z $sshUri
    echo "usage: ssh-socks user@hostname" 
  else
    ssh -D 1337 -qCN $sshUri
  end
end
