#! /bin/sh
cd ~/source/art
echo 'starting sync'
git stash
git pull --rebase
/usr/local/bin/python3 make_readme.py
git stash pop
git add .
msg="cron sync - $(/bin/date)"
git commit -m "${msg}"
git push
