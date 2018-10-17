#!/bin/bash
easter_offset = 0;
ascension_offset = 39
pentecost_offset = 49
trinity_offset = 56
corpus_offset = 60
holydays = @("Uskrs", "Uznesenje", "Duhovi", "Presveto Trojstvo", "Tjelovo")

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

 g_date= $(date -d 

 return get-date -year $year -Month $month -Day $day
}

