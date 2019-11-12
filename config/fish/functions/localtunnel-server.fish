function localtunnel-server
  mkdir -p ~/Documents/localtunnel-server/ssl
  openssl req -x509 -newkey rsa:4096 -keyout ~/Documents/localtunnel-server/ssl/server.key -out ~/Documents/localtunnel-server/ssl/server.crt -nodes -days 365 -subj '/CN=localhost'
  docker run -d \
    --name localtunnel-nginx \
    --restart always \
    --net host \
    -v "$HOME"/Documents/localtunnel-server/ssl:/etc/nginx/ssl/ \
    defunctzombie/localtunnel-nginx:latest
  docker run -d \
    --restart always \
    --name localtunnel \
    --net host \
    localtunnel/server:latest --port 3000
end
