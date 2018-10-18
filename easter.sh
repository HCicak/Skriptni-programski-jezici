#!/bin/bash
easter_offset=0
ascension_offset=39
pentecost_offset=49
trinity_offset=56
corpus_offset=60
holydays=( "Uskrs" "Uznesenje" "Duhovi" "Presveto Trojstvo" "Tjelovo" )

function calculate_easter() {
 local year=$1
 a=$(( year % 19 ))
 b=$(( year / 100 ))
 c=$(( year % 100 ))
 d=$(( b / 4 ))
 e=$(( b % 4 ))
 f=$(( ( b + 8 ) / 25 ))
 g=$(( ( b - f + 1 ) / 3 ))
 h=$(( ( ( 19 * a + b - d - g) + 15) % 30 ))
 i=$(( c / 4 ))
 k=$(( c % 4 ))
 l=$(( ( 32 + 2 * e + 2 * i - h - k ) % 7 ))
 m=$(( ( a + 11 * h + 22 * l) / 451 ))
 numerator=$(( h + l - 7 * m + 114 ))
 month=$(( numerator / 31 ))
 day=$(( ( numerator % 31 ) + 1 ))

 g_date="$year-$month-$day"
}

function output_holidays() {
 local year=$1
 calculate_easter $year
 l_easter=$(date +"%a %d %b" -d "$g_date + $easter_offset days" )
 l_ascension=$(date +"%a %d %b" -d "$g_date + $ascension_offset days" )
 l_pentecost=$(date +"%a %d %b" -d "$g_date + $pentecost_offset days" )
 l_trinity=$(date +"%a %d %b" -d "$g_date + $trinity_offset days" )
 l_corpus=$(date +"%a %d %b" -d "$g_date + $corpus_offset days" )
 l_out_str="${holydays[0]}: $l_easter  ${holydays[1]}: $l_ascension ${holydays[2]}: $l_pentecost  ${holydays[3]}: $l_trinity  ${holydays[4]}: $l_corpus"
 echo "godina $year: $l_out_str"
}

for ((year = 400;year<=2100; year+=100 )) do
  output_holidays $year
done
echo " "
for ((year = 2010; year<=2020; year++)) do
  output_holidays $year
done
