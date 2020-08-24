function amap
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux amap $argv
end

function arpspoof
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux arpspoof -i eth0 $argv
end 

function assetfinder
  docker run --rm -i heywoodlh/tomnomnom-tools:latest assetfinder $argv
end

function beef
  mkdir -p ~/Documents/beef
  if test ! -f ~/Documents/beef/config.yaml
    curl 'https://gist.githubusercontent.com/heywoodlh/5d503e14f91ff9e5d6d4794aeffda652/raw/9bf62f88c3ca54255a3f5f2e85f25ebededbe8aa/config.yaml' -o ~/Documents/beef/config.yaml
  end
  if docker ps -a | grep -q 'beef-framework'
    docker start beef-framework
  else
    docker run --name beef-framework -d -p 3000:3000 -v ~/Documents/beef/config.yaml:/opt/beef/config.yaml heywoodlh/beef $argv
  end
  printf "\n\n\nBEEF started!\nBEEF admin panel: http://localhost:3000/ui/panel\nconfig located at ~/Documents/beef/config.yaml"
end

function bettercap
  docker run -it --privileged --net=host bettercap/bettercap $argv
end

function commix
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux commix $argv
end

function dirb
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux dirb $argv
end

function dnschef
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host heywoodlh/kali-linux dnschef
end

function dnsenum
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux dnsenum $argv
end

function dnsmap
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux dnsmap $argv
end

function dnsrecon
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux dnsrecon $argv
end

function dnswalk
  docker run -it --rm heywoodlh/kali-linux dnswalk $argv
end

function evilginx
  mkdir -p ~/Documents/evilginx
  if docker ps -a | grep -q evilginx
    docker exec -it evilginx evilginx
  else
    docker pull heywoodlh/evilginx2
    docker run --name evilginx -it -p 53:53 -p 80:80 -p 443:443 -v ~/Documents/evilginx:/go/src/github.com/kgretzky/evilginx2 heywoodlh/evilginx2 $argv
  end
end

function fsociety
  set working_dir (pwd)
  git clone https://github.com/Manisso/fsociety ~/.fsociety
  cd ~/.fsociety
  docker-compose build
  docker-compose up -d
  docker-compose exec fsociety fsociety
  cd "$working_dir"
end

function fsociety-poweroff
  set working_dir (pwd)
  cd ~/.fsociety
  docker-compose down
  cd "$working_dir"
end

function geoiplookup
    curl ipinfo.io/"$argv[1]"
end

function gf
  docker run --rm -i heywoodlh/tomnomnom-tools:latest gf $argv
end

function gobuster
  set secListDir ~/git/seclists
  if test ! -d $secListDir
    mkdir -p $secListDir
    git clone https://github.com/danielmiessler/SecLists $secListDir
  end
  docker run --rm -i -w /data -v $secListDir:/data nateysmith/bugbountytools:latest bash -c "gobuster $argv"
end

function gophish
  echo 'starting gophish at https://localhost:3333'
  if docker volume ls | grep -q gophish_config
    docker volume create gophish_config
  end
  docker run --name gophish -d -e PHISH_LISTEN_URL=0.0.0.0:8080 -v gophish_config:/opt/gophish --net host gophish/gophish
  if docker ps | grep -iq gophish
    echo 'gophish is running'
    echo 'default creds: admin:gophish'
  else
    echo 'gophish unable to start'
  end
end

function gron
  docker run --rm -i heywoodlh/tomnomnom-tools:latest gron $argv
end

function gscript
  docker run -it --rm -v /tmp:/tmp -v (pwd):/root/gscript -w /root/gscript gen0cide/gscript:v1 /root/go/bin/gscript $argv
end

function h8mail
  if test -f ~/.config/h8mail/config
    docker run -v (pwd):/tmp/h8mail -w /tmp/h8mail -v ~/.config/h8mail/config:/tmp/config -ti kh4st3x00/h8mail -c /tmp/config $argv
  else
    docker run -v (pwd):/tmp/h8mail -w /tmp/h8mail -ti kh4st3x00/h8mail $argv
  end
end

function hping3
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux hping3 $argv
end

function http-server
  if test -z $argv[1]
    echo 'usage: http-server /path/to/folder'
  else
    docker run -d --name http -p 80:80 -v $argv[1]:/usr/local/apache2/htdocs httpd:latest
  end
end

function httping
  docker run --rm bretfisher/httping $argv
end

function httprobe
  docker run --rm -i heywoodlh/tomnomnom-tools:latest httprobe $argv
end

function httrack
  if [ ! -n $argv[1] ]
    echo "usage: httrack https://google.com"
  else
    set uri $argv[1]
    docker run --rm -it --net host -v (pwd):/app -e HTTRACK_URI=$uri ralfbs/httrack:latest
  end
end

function hydra
  docker run --rm --net host -v (pwd):/data -v /tmp:/tmp --privileged heywoodlh/kali-linux hydra $argv
end

function inception
  docker run  --rm -i -w /data -v (pwd):/data -v /tmp:/tmp nateysmith/bugbountytools:latest bash -c "inception $argv"
end

function openvas
  echo 'starting openvas at https://localhost'
  docker run -d -p 443:443 -p 9390:9390 --name openvas mikesplain/openvas
  if docker ps | grep -iq 'openvas'
    echo 'openvas is running'
    echo 'default creds: admin:admin'
  else
    echo 'openvas has crashed'
  end
end

if uname -a | grep -iq linux
  function jackit
    docker run --rm -it --name jackit --privileged -v (pwd):/tmp/jackit -w /tmp/jackit -v /dev/bus/usb:/dev/bus/usb heywoodlh/jackit jackit $argv
  end
end

function kali
  docker run -it --rm --net host --privileged -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority heywoodlh/kali-linux /bin/bash $argv
end

function lokis-portal
  if test -f (pwd)/creds.html
    echo 'starting lokis-portal at http://localhost:8080' &&\
    sleep 3 &&\
    docker run -it --rm --name lokis-portal -v (pwd)/creds.html:/var/www/html/creds.html -p 8080:80 --sysctl net.ipv4.ip_unprivileged_port_start=0 heywoodlh/lokis-portal
  else
    touch (pwd)/creds.html &&\
    echo 'starting lokis-portal at http://localhost:8080' &&\
    sleep 3 &&\
    docker run -it --rm --name lokis-portal -v (pwd)/creds.html:/var/www/html/creds.html -p 8080:80 --sysctl net.ipv4.ip_unprivileged_port_start=0 heywoodlh/lokis-portal
  end
end

function masscan
  docker run --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp --privileged heywoodlh/telnet masscan $argv
end

function medusa
  docker run -i --rm heywoodlh/kali-linux medusa
end

function meg
  docker run -v (pwd):/data -w /data --rm -it heywoodlh/tomnomnom-tools:latest meg $argv
end

function merlin
  if test (command -v screen)
    docker pull heywoodlh/merlin
    screen -S merlin-server -d -m docker run --name merlin --restart unless-stopped -net host -it heywoodlh/merlin /usr/bin/merlinserver -i 0.0.0.0 $argv && echo "Attach to merlin server: screen -r merlin-server"
  else
    echo "Please install screen before running merlin function"
  end
end

function mitmproxy
  docker run --rm -it -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-iface 0.0.0.0 $argv
end

function msfconsole
  mkdir -p ~/.docker/metasploit/
  docker run -it --rm --net host -v ~/.docker/metasploit/:/home/metasploit/.msf4 -w /home/metasploit/session -v (pwd):/home/metasploit/session heywoodlh/metasploit msfconsole $argv
end

function msfvenom
  mkdir -p ~/.docker/metasploit/
  docker run -it --rm -v ~/.docker/metasploit/:/home/metasploit/.msf4 -w /home/metasploit/session -v (pwd):/home/metasploit/session heywoodlh/metasploit msfvenom $argv
end

function nc
  docker run --rm -i --net host heywoodlh/telnet nc $argv
end

function ndiff
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux ndiff $argv
end

function netscan
  docker run -it --rm --net host heywoodlh/red /opt/red-scripts/netscan.sh $argv
end

function netcat
  docker run --rm -i --net host heywoodlh/telnet nc $argv
end

function netdiscover
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux netdiscover $argv
end

function nfs-server
  if test -z $argv[1]
    echo 'usage: nfs-server /path/to/folder'
  else
    docker run -d --name nfs --privileged -v $argv[1]:/nfsshare -e SHARED_DIRECTORY=/nfsshare itsthenetwork/nfs-server-alpine:latest
  end
end

function nikto
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux nikto $argv
end

function nmap
  docker run --rm --net host --privileged heywoodlh/telnet nmap $argv
end

function padbuster
  docker run -it --rm heywoodlh/kali-linux padbuster $argv
end

function reaver
  docker run -it --rm --net host --privileged -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux reaver $argv
end

function responder
  docker run -it --rm --net host heywoodlh/kali-linux responder $argv
end

function sandbox
  if docker ps -a | grep -q 'sandbox'
    docker start sandbox > /dev/null
  else
    docker run -d --name sandbox --cap-add=NET_ADMIN --cap-add=NET_RAW --privileged heywoodlh/sandbox > /dev/null
  end
  docker exec -it sandbox /usr/bin/fish
  echo "Stop sandbox container? (yes/no)"
  read answer
  if test "$answer" = "yes"
    docker stop sandbox > /dev/null
  end
end

function scan-site
  for site in $argv
    echo "queuing scan for $site"
    set uuid (urlscan scan --url $site | grep "uuid" | awk '{print $2}' | tr -d \",)

    set loop "True"
    
    echo "waiting for scan results"
    while test $loop = "True"
      set output (urlscan retrieve --uuid $uuid --summary 2> /dev/null)
      if test $status -eq 0
        urlscan retrieve --uuid $uuid --summary
        set loop "False"
      end
      sleep 10
    end
  end
end

function searchsploit
  docker run --rm heywoodlh/kali-linux searchsploit $argv
end

function setoolkit
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux setoolkit $argv
end

function shodan
  if test ! -e ~/.shodan/api_key
    mkdir -p ~/.shodan/
  end
  docker run --rm -it -v ~/.shodan:/home/shodan/.shodan heywoodlh/shodan-cli $argv
end

function smb-server
  if test -z $argv[1]
    echo 'usage: smb-server /path/to/folder'
  else
    docker run -d --name smb -p 139:139 -p 445:445 -v $argv[1]:/mount dperson/samba -p -s "public;/mount"
  end
end

function sniper
  docker run --rm -ti menzo/sn1per-docker sniper $argv
end

function sqlmap
  docker run -it --rm --net host -w /data -v ~/.sqlmap:/root/.sqlmap -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux sqlmap $argv
end

function socat
  docker run --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host heywoodlh/kali-linux socat $argv
end

function st-server
  if test -z $argv[1]
    echo 'usage: st-server [password]'
  else
    docker run -d --name st-server --net host heywoodlh/silenttrinity /opt/SILENTTRINITY/st.py teamserver 0.0.0.0 $argv[1]
  end
end

function st-client
  if test -z $argv[1]
    echo 'usage: st-client wss://<username>:<teamserver_password>@<teamserver_ip>:5000'
  else
    docker run --net host -it --rm heywoodlh/silenttrinity /opt/SILENTTRINITY/st.py client $argv[1]
  end
end

function telnet
  docker run --rm -i heywoodlh/telnet telnet $argv
end

function theharvester
  docker run --rm -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux theHarvester $argv
end

function traceroute
  docker run --rm -it \
    --net host \
    jess/traceroute "$argv"
end

function tshark
  docker run --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host --privileged heywoodlh/kali-linux tshark $argv
end

function tsunami
  mkdir -p tsunami
  if count $argv > /dev/null
    if echo $argv | grep -q '\-\-help'
      docker run -v (pwd):/data -it --rm heywoodlh/tsunami --help | grep -iv "INFO" | grep -iv "com.google" | grep -E '\-\-|Options' | grep -iv 'Unknown option'
    else
      docker run -v (pwd):/data -it --rm heywoodlh/tsunami $argv --scan-results-local-output-filename /data/tsunami/results.json --scan-results-local-output-format JSON > /dev/null &&\
      echo "writing results to ./tsunami/results.json"
    end
  else
    echo "usage: tsunami [ --ip-v4-target 192.168.1.1, --hostname-target example.com ... ]"
  end
end

function unfurl
  docker run --rm -i heywoodlh/tomnomnom-tools:latest unfurl $argv
end

function urlscan
  if string match -q -- "scan" $argv; or string match -q -- "retrieve" $argv
    if [ -e ~/.password-store/urlscan.io/api.gpg ]
      set api (pass urlscan.io/api)
      set argv $argv --api $api
    end
  end
  docker run --rm -i -v (pwd):/tmp -w /tmp -v ~/.urlscan:/root/.urlscan heywoodlh/urlscan-py:latest $argv
end

function vol.py
  if test -f ~/.volatilityrc
    docker run -it --rm -v ~/.volatilityrc:/root/.volatilityrc -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/volatility --conf-file /root/.volatilityrc $argv
  else
    echo 'Remember to set needed volatility conf in ~/.volatilityrc. Creating new config file now. Please edit it.'
    echo 'Paths are relative to (pwd):/data'
    printf "[DEFAULT]\nPROFILE=Win7SP0x86\nLOCATION=file:///data/memory.lime\nPLUGINS=/data\n" > ~/.volatilityrc
    docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/volatility $argv
  end
end

function vt
  if [ -e ~/.password-store/virustotal/api.gpg ]
    set api (pass virustotal/api)
    set argv $argv --apikey $api
  end
  docker run -it -w /data -v (pwd):/data --rm heywoodlh/vt-cli $argv
end

function vulnscan
  docker run --rm --net host --privileged heywoodlh/red nmap -sV --script=vulscan/vulscan.nse $argv
end

function wash
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host --privileged heywoodlh/kali-linux wash $argv
end

function waybackurls
  docker run --rm -i heywoodlh/tomnomnom-tools:latest waybackurls $argv
end

function webscarab
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host heywoodlh/kali-linux java -jar /usr/bin/webscarab $argv
end

function whatismyip
  curl 'https://api.ipify.org?format=text'
end

function wifite
  docker run -it --rm --net host --privileged -w /tmp/wifite -v (pwd):/tmp/wifite heywoodlh/wifite wifite $argv
end

function wpscan
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux wpscan $argv
end

function yersinia
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp heywoodlh/kali-linux yersinia $argv
end

function zaproxy
  docker run -it --rm -v ~/.ZAP:/root/.ZAP -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host heywoodlh/kali-linux zaproxy $argv
end
