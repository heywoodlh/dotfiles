function netscan
  mkdir -p ~/git/
  if echo $argv | grep -q http-crawl
    if [ ! -e ~/git/seclists ]
      echo "git clone github.com/DanielMiessler/SecLists ~/git/seclists"
      git clone https://github.com/DanielMiessler/SecLists ~/git/seclists
    end
    docker run -it --rm -v (pwd):/data -w /data --net host -v ~/git/seclists/Discovery/Web-Content/Apache.fuzz.txt:/etc/paths heywoodlh/red /opt/red-scripts/netscan.sh $argv
  else
    docker run -it --rm -v (pwd):/data -w /data --net host heywoodlh/red /opt/red-scripts/netscan.sh $argv
  end
end
