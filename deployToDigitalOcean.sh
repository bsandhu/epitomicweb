#!/usr/bin/env bash

echo "*** Deploying to DigitalOcean - assuming that SSH keys for CodeShip are added to target host ***"
echo""

ssh root@45.55.192.142 'mkdir ~/epitomicweb'
scp * root@45.55.192.142:~/epitomicweb;
scp -rC server root@45.55.192.142:~/epitomicweb;
scp -rC site root@45.55.192.142:~/epitomicweb;

echo""
echo "*** Done ***"
echo""
echo "*** Killing Node ***"
ssh root@45.55.192.142 kill $(ps -ef | grep '[s]erver/start.js' | awk '{print $2}')
echo""
echo "*** Starting Node ***"
ssh root@45.55.192.142 'cd ~/epitomicweb;npm install;nohup nodejs ./server/start.js &'

exit