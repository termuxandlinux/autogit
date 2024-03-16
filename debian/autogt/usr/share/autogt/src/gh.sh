#!/bin/bash
echo " "
echo "[+] start setup after gh"
echo "[+] add files"
echo " "
git add .
echo " "
echo "[+] set commit (create)"
echo " "
git commit -m create
echo " "
echo "[+] checkout main"
echo " "
git branch -m main
git checkout main
echo " "
echo "[+] set upstream"
echo " "
git push --set-upstream origin main
echo " "
echo "[+] push first"
echo " "
git push -u origin
echo " "
echo "[+] setup finish, run now only autogit --push"
echo "[+] bye, bye ;P"
