function libreoffice
  if ! docker volume ls | grep -iq libreoffice
    docker volume create libreoffice
  end

  if ! docker network ls | grep -iq libreoffice
    docker network create libreoffice
  end
  

  docker run -d --name=libreoffice --restart=unless-stopped \
    -p 9980:9980 \
    --network libreoffice \
    -v libreoffice:/etc/loolwsd \
    -e DONT_GEN_SSL_CERT=1 \
    -e extra_params="--o:ssl.enable=false" \
    -e domain="nextcloud" \
    --cap-add MKNOD \
    --cap-add SYS_ADMIN \
    libreoffice/online:latest

  if ! docker volume ls | grep -iq nextcloud
    docker volume create nextcloud
  end
  docker run --name=nextcloud -d --restart=unless-stopped \
    --network libreoffice \
    -v nextcloud:/var/www/html \
    -e NEXTCLOUD_TRUSTED_DOMAINS="nextcloud" \
    -p 80:80 \
    nextcloud:stable-apache

  if ! grep -E 'nextcloud|libreoffice' /etc/hosts
    echo 'entries for nextcloud/libreoffice not in /etc/hosts'
    sudo mv /etc/hosts{,.backup} && sudo awk '/^127.0.0.1/ {$0=$0" nextcloud libreoffice"} 1' /etc/hosts.backup > /etc/hosts
  end

end
