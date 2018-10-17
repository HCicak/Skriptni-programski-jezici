# Autor Hrvoje Čičak - https://rosettacode.org/wiki/99_Bottles_of_Beer
# krećemo odmah s repeticijom
for ( $bottles = 99; $bottles -gt 0; $bottles--) {
  # hendlamo jedniinu/množinu
  if ($BottLes -gt 1) {
    echo "$bottles bottles of beer on the wall,"
    echo "$bottles bottles of beer"
  } else {
    echo "$bottles bottle of beer on the wall,"
    echo "$bottles bottle of beer"
  }
  echo "Take one down, pass it around"
  # ovisno o bottles-1 mjenjamo kraj kitice primjer case petlje
  switch ($bottles-1) {
    1 {
      echo "$($bottles - 1 ) bottle of beer on the wall."
    }
    0 {
      echo "no more bottles of beer on the wall."
    }
    default {
      echo "$($bottles - 1 ) bottle of beer on the wall."
    }
  }
  echo " "
  
}
