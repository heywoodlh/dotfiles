function libreoffice
  if ! docker volume ls | grep -iq libreoffice
    docker volume create libreoffice
  end
  
  docker run -d --name=libreoffice --restart=unless-stopped \
    -p 9980:9980 \
    -v libreoffice:/etc/loolwsd \
    -e DONT_GEN_SSL_CERT=1 \
    -e extra_params="--o:ssl.enable=false" \
    libreoffice/online:latest

  if ! docker volume ls | grep -iq nextcloud
    docker volume create nextcloud
  end
  docker run --name=nextcloud -d --restart=unless-stopped \
    --link libreoffice:libreoffice \
    -v nextcloud:/var/www/html \
    -e NEXTCLOUD_TRUSTED_DOMAINS="nextcloud" \
    -e NEXTCLOUD_ADMIN_USER="admin" \
    -e NEXTCLOUD_ADMIN_PASSWORD="admin" \
    -p 9080:80 \
    nextcloud:stable-apache

end
