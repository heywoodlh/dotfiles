function libreoffice
  if ! docker volume ls | grep -iq libreoffice
    docker volume create libreoffice
  end
  if ! docker network ls | grep -iq nextcloud_libreoffice
    docker network create nextcloud_libreoffice
  end
  docker run -d --name=libreoffice --restart=unless-stopped \
    -v libreoffice:/etc/loolwsd \
    --network nextcloud_libreoffice \
    libreoffice/online:latest

  if ! docker volume ls | grep -iq nextcloud
    docker volume create nextcloud
  end
  docker run --name=nextcloud -d --restart=unless-stopped \
    --network nextcloud_libreoffice \
    -v nextcloud:/var/www/html \
    -e NEXTCLOUD_TRUSTED_DOMAINS="localhost" \
    -e NEXTCLOUD_ADMIN_USER="admin" \
    -e NEXTCLOUD_ADMIN_PASSWORD="admin" \
    -p 9080:80 \
    nextcloud:stable-apache

end
