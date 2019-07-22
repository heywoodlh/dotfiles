function amap
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full amap $argv
end

function assetfinder
  docker run --rm -i heywoodlh/tomnomnom-tools:latest assetfinder $argv
end

function commix
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full commix $argv
end

function dirb
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full dirb $argv
end

function dnschef
  docker run -it --rm -w /data -v (pwd):/data --net host booyaabes/kali-linux-full dnschef
end

function dnsenum
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full dnsenum $argv
end

function dnsmap
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full dnsmap $argv
end

function dnsrecon
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full dnsrecon $argv
end

function dnswalk
  docker run -it --rm booyaabes/kali-linux-full dnswalk $argv
end

function gf
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | gf $argv"
end

function gron
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "gron $argv"
end

function hping3
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full hping3 $argv
end

function httprobe
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | httprobe $argv"
end

function hydra
  docker run --rm --net host -v (pwd):/data --privileged booyaabes/kali-linux-full hydra $argv
end

function masscan
  docker run --rm --net host -v (pwd):/data --privileged booyaabes/kali-linux-full masscan $argv
end

function meg
  if test -z $argv[1]; or test -z $argv[2]
    echo 'meg [path|pathsFile] [hostsFile] [outputDir]'
  else
    set pathsFile $argv[1]
    set hostsFile $argv[2]
    if test -z $argv[3]
      set outDir 'out'
      if test ! -f $outDir
        mkdir -p $outDir
      end
    else
      set outDir $argv[3]
    end
    if test -f $pathsFile
      docker run -v $pathsFile:/tmp/paths -v $hostsFile:/tmp/hosts -v $outDir:/tmp/outDir --rm -i heywoodlh/tomnomnom-tools:latest meg /tmp/paths /tmp/hosts /tmp/outDir $argv[4..20]
    else
      docker run -v $hostsFile:/tmp/hosts -v $outDir:/tmp/outDir --rm -i heywoodlh/tomnomnom-tools:latest meg $pathsFile /tmp/hosts /tmp/outDir $argv[4..20]
    end
  end
end

function msfconsole
  docker run -it --rm --net host  -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data booyaabes/kali-linux-full msfconsole $argv
end

function msfvenom
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full msfvenom $argv
end

function ndiff
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full ndiff $argv
end

function netdiscover
  docker run -it --rm --net host -w /data -v (pwd):/data booyaabes/kali-linux-full netdiscover $argv
end

function nikto
  docker run -it --rm --net host -w /data -v (pwd):/data booyaabes/kali-linux-full nikto $argv
end

function nmap
  docker run --rm --net host --privileged booyaabes/kali-linux-full nmap $argv
end

function padbuster
  docker run -it --rm booyaabes/kali-linux-full padbuster $argv
end

function reaver
  docker run -it --rm --net host --privileged -w /data -v (pwd):/data booyaabes/kali-linux-full reaver $argv
end

function responder
  docker run -it --rm --net host booyaabes/kali-linux-full responder $argv
end

function searchsploit
  docker run --rm booyaabes/kali-linux-full searchsploit $argv
end

function sqlmap
  docker run -it --rm --net host -w /data -v ~/.sqlmap:/root/.sqlmap -v (pwd):/data booyaabes/kali-linux-full sqlmap $argv
end

function socat
  docker run --rm -w /data -v (pwd):/data --net host booyaabes/kali-linux-full socat $argv
end

function telnet
  docker run --rm mikesplain/telnet $argv
end

function theharvester
  docker run --rm -v (pwd):/data booyaabes/kali-linux-full theharvester $argv
end

function tshark
  docker run --rm -w /data -v (pwd):/data --net host --privileged booyaabes/kali-linux-full tshark $argv
end

function unfurl
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | unfurl $argv"
end

function volafox
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full volafox $argv
end

function volatility
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full volatility $argv
end

function wash
  docker run -it --rm -w /data -v (pwd):/data --net host --privileged booyaabes/kali-linux-full wash $argv
end

function waybackurls
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | waybackurls $argv"
end

function webscarab
  docker run -it --rm -w /data -v (pwd):/data -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full java -jar /usr/bin/webscarab $argv
end

function wpscan
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full wpscan $argv
end

function yersinia
  docker run -it --rm -w /data -v (pwd):/data booyaabes/kali-linux-full yersinia $argv
end

function zaproxy
  docker run -it --rm -v ~/.ZAP:/root/.ZAP -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full zaproxy $argv
end
