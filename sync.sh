#! /bin/sh
cd ~/source/art
echo 'starting sync'
git pull --rebase
git add .
msg="cron sync - $(/bin/date)"
git commit -m "${msg}"
git push
