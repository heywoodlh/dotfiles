#!/usr/bin/env bash
echo 'Bitwarden server URL: '
read BW_SERVER
bw config server "$BW_SERVER"

bw login --raw >> ~/.bw_session
(crontab -l ; echo "*/30 * * * * rm ~/.bw_session")| crontab -

sudo pip3 install virtualfish
