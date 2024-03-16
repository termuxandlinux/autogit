#!/bin/bash
echo " "
echo "[+] add files"
echo " "
git add .
echo " "
echo "[+] add files succesfull"
echo "[+] set commit (update)"
echo " "
git commit -m update
echo " "
echo "[+] set commit"
echo "[+] push to git"
echo " "
git push -u origin
echo " "
echo "[+] push succesfull"
echo "[+] bye, bye "

