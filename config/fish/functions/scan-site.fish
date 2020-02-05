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
