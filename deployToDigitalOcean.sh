#!/usr/bin/env bash

echo "*** Deploying to DigitalOcean - assuming that SSH keys for CodeShip are added to target host ***"
echo""

rsync -rvzhe ssh --exclude '.git*' --delete . root@104.131.181.244:/etc/nginx/sites-available/epitomicweb

echo""
echo "*** Fiished rsync ***"
echo""
echo "*** Restart nginx ***"
ssh root@104.131.181.244 nginx -s reload
echo""
echo "*** Done ***"

exit