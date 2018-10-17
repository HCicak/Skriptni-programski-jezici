# Autor: Hrvoje Čičak - zadatak se nalazi na https://rosettacode.org/wiki/Chinese_zodiac
# nastala na temelju PowerShell skripe s te stranice
# primjer eksplicitnie sintakse za definiciju niza "@("- sa ekspandirajućim navodnicima (") i literalnima (')
$pinyin = @('甲','乙','丙','丁','戊','己','庚','辛','壬','癸','子','丑','寅','卯','辰','巳','午','未','申','酉','戌','亥')
$pinyin_ascii = @("jiă","yĭ","bĭng","dīng","wù","jĭ","gēng","xīn","rén","gŭi","zĭ","chŏu","yín","măo","chén","sì","wŭ","wèi","shēn","yŏu","xū","hài")
# varijabla inicijalizirana na vrijednost "4"
$base = 4
# obične varijable, inicijalizirane na 0
$celestial = 0
$terrestrial = 0
# još jedan način deklariranja array-a - ovaj put samo nabrajanjem elemenata
$animals = 'Štakora', 'Vola', 'Tigra', 'Zeca', 'Zmaja', 'Zmije', 'Konja', 'Koze', 'Majmuna', 'Pijetla', 'Psa', 'Svinje'
$elements= 'Drvo', 'Vatra', 'Zemlja', 'Metal', 'Voda'
$aspects = 'yang', 'yin'
# command  line arguments - if (args == 0) then... obratiti pažnju na whitespace; $# - broj argumenata; $@ - vrijednosti argumenata
if ( $args.Count -eq 0 ) {
  # postavljamo vrijednost tekuće godine
  $asked_year = (Get-Date).Year   # i get-date -UFormat %Y radi
}
else {
  # kopriamo argumente u niz, usput radimo i ekspanziju - zato navodnici
  $asked_year = $args
} 
# foreach iteracija kroz array 
foreach ($year in $asked_year) {
  $cycle_year = $year - $base 
  $stem_number = $cycle_year % 10
  $celestial = $stem_number
  $terrestrial =$branch_number + 10
  # trik - koristimo .NET math lib za floor funkciju (2/3=0)
  $element_number = [math]::Floor($stem_number / 2 )
  $branch_number = $cycle_year % 12
  $aspect_number= $cycle_year % 2 
  $index= $cycle_year % 60 + 1 

  echo "$year je godina $($animals[$branch_number])."
  echo "Element je: $($elements[$element_number])."
  echo "Aspekt je: $($aspects[$aspect_number])."
  echo "To je $index godina u ciklusu."
  echo "Kineska oznaka za to je: $($pinyin[$celestial])$($pinyin[$terrestrial]) odnosno: $($pinyin_ascii[$celestial])-$($pinyin_ascii[$terrestrial])."
  echo "------------------------------------------"
}
