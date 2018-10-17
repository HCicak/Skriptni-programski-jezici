#!/bin/bash
# Autor Hrvoje Čičak - https://rosettacode.org/wiki/99_Bottles_of_Beer
# krećemo odmah s repeticijom
for ((bottles=99; bottles>0; bottles--)); do
  # množina za sve osim 1 boce
  if [ $bottles -gt 1 ]; then
    echo "$bottles bottles of beer on the wall,"
    echo "$bottles bottles of beer."
  else
    echo "$bottles bottle of beer on the wall,"
    echo "$bottles bottle of beer."
  fi
  echo "Take one down, pass it around"
  # primjer case-a ";;"" označava kraj jednog izbora u case (u slučaju više naredbi)
  # "*" je falltrough, za sve ostale vrijednosti osim 0 i jedan u ovom slučaju
  case "$(( bottles - 1 ))" in
  1)
    echo "$(( bottles - 1 )) bottle of beer on the wall." ;;
  0)
    echo "no more bottles of beer on the wall." ;;
  *)
    echo "$(( bottles - 1 )) bottles of beer on the wall."
  esac
  echo " "
done
