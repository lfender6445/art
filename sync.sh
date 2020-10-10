#! /bin/sh
cd ~/source/art
echo 'starting sync'
git pull --rebase
/usr/local/bin/python3 make_readme.py
git add .
msg="cron sync - $(/bin/date)"
git commit -m "${msg}"
git push
