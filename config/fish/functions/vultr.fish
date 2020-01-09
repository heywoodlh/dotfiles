function vultr-testing-create
  if vultr-cli server list | grep -q 'testing.heywoody.me'
    echo 'testing.heywoody.me already exists, destroy it? (yes/no)'
    read response
    if test "$response" = "yes"
      echo 'destroying testing.heywoody.me'
      set serverId (vultr-cli server list | grep 'testing.heywoody.me' | awk '{print $1}')
      vultr-cli server delete "$serverId"

      echo 'collecting configuration information' 
      set planId (vultr-cli plans list | grep '5.00' | grep '1024 MB' | awk '{print $1}') 
      set serverRegion (vultr-cli regions list | grep 'Silicon Valley' | awk '{print $1}')
      set serverOs (vultr-cli os list | grep 'Ubuntu 18.04' | awk '{print $1}')
      set scriptId (vultr-cli script list | grep 'ubuntu-dev-env' | awk '{print $1}')
      echo 'creating testing.heywoody.me'
      vultr-cli server create --region "$serverRegion" --plan "$planId" --os "$serverOs" --script-id "$scriptId" --host testing.heywoody.me --label testing.heywoody.me
      printf "\n"
      echo 'waiting 10 seconds to check ip address of testing.heywoody.me'
      sleep 10
      set serverIp (vultr-cli server list | grep 'testing.heywoody.me' | awk '{print $2}')
      if test -n "$serverIp"
        echo "ip address: $serverIp"
      else
        echo "unable to obtain ip"
      end
    end
  else
    echo 'collecting configuration information' 
    set planId (vultr-cli plans list | grep '5.00' | grep '1024 MB' | awk '{print $1}') 
    set serverRegion (vultr-cli regions list | grep 'Silicon Valley' | awk '{print $1}')
    set serverOs (vultr-cli os list | grep 'Ubuntu 18.04' | awk '{print $1}')
    set scriptId (vultr-cli script list | grep 'ubuntu-dev-env' | awk '{print $1}')
    echo 'creating testing.heywoody.me'
    vultr-cli server create --region "$serverRegion" --plan "$planId" --os "$serverOs" --script-id "$scriptId" --host testing.heywoody.me --label testing.heywoody.me
    printf "\n"
    echo 'waiting 10 seconds to check ip address of testing.heywoody.me'
    sleep 10
    set serverIp (vultr-cli server list | grep 'testing.heywoody.me' | awk '{print $2}')
    if test -n "$serverIp"
      echo "ip address: $serverIp"
    else
      echo "unable to obtain ip"
    end
  end
end

function vultr-testing-destroy
  if vultr-cli server list | grep -q 'testing.heywoody.me'
    echo 'destroy testing.heywoody.me? (yes/no)'
    read response
    if test "$response" = "yes"
      echo 'destroying testing.heywoody.me'
      set serverId (vultr-cli server list | grep 'testing.heywoody.me' | awk '{print $1}')
      vultr-cli server delete "$serverId"
    end
  else
    echo 'testing.heywoody.me does not exist, exiting'
  end
end
