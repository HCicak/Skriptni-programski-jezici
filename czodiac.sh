#!/bin/bash
# Autor: Hrvoje Čičak - zadatak se nalazi na https://rosettacode.org/wiki/Chinese_zodiac
# nastala na temelju PowerShell skripe s te stranice
# deklaracije string array-a korištenje obiju vrsti navodnika
declare -a pinyin=('甲' '乙' '丙' '丁' '戊' '己' '庚' '辛' '壬' '癸' '子' '丑' '寅' '卯' '辰' '巳' '午' '未' '申' '酉' '戌' '亥')
declare -a pinyin_ascii=("jiă" "yĭ" "bĭng" "dīng" "wù" "jĭ" "gēng" "xīn" "rén" "gŭi" "zĭ" "chŏu" "yín" "măo" "chén" "sì" "wŭ" "wèi" "shēn" "yŏu" "xū" "hài")
# varijabla inicijalizirana na vrijednost "4"
base=4
# obične varijable, inicijalizirane na 0
celestial=0
terrestrial=0
# još jedan način deklariranja array-a - ovaj put bez declare
animals=('Štakora' 'Vola' 'Tigra' 'Zeca' 'Zmaja' 'Zmije' 'Konja' 'Koze' 'Majmuna' 'Pijetla' 'Psa' 'Svinje')
elements=('Drvo' 'Vatra' 'Zemlja' 'Metal' 'Voda')
aspects=('yang' 'yin')
# command  line arguments - if (args == 0) then... obratiti pažnju na whitespace; $# - broj argumenata; $@ - vrijednosti argumenata
if [ $# -eq 0 ]; then
  # postavljamo 0 element niza na vrijednost tekuće godine
  asked_year[0]=`date +%Y`
else
  # kopriamo argumente u niz, usput radimo i ekspanziju - zato navodnici
  asked_year=( "$@" )
fi  # end if u skripti je "fi" logično, zar ne?
# for petlja sintaksa slična c-u "((  ))" označavaju aritmetičke operacije
for ((i=0; i<${#asked_year[@]}; i++)); do
  cycle_year=$(( asked_year[i] - base ))
  stem_number=$(( cycle_year % 10 ))
  celestial=$stem_number
  terrestrial=$(( branch_number + 10 ))
  # trik - nema floating point aritmetike već cijelobrojno djeljenje, ponaša se kao floor funkcija (2/3=0)
  element_number=$(( stem_number / 2 ))
  branch_number=$(( cycle_year % 12 ))
  aspect_number=$(( cycle_year % 2 ))
  index=$(( cycle_year % 60 + 1 ))

  echo "${asked_year[i]} je godina ${animals[branch_number]}."
  echo "Element je: ${elements[element_number]}."
  echo "Aspekt je: ${aspects[aspect_number]}."
  echo "To je $index godina u ciklusu."
  echo "Kineska oznaka za to je: ${pinyin[celestial]}${pinyin[terrestrial]} odnosno: ${pinyin_ascii[celestial]}-${pinyin_ascii[terrestrial]}."
  echo "------------------------------------------"
done
