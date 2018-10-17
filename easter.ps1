$easter_offset = 0;
$ascension_offset = 39
$pentecost_offset = 49
$trinity_offset = 56
$corpus_offset = 60
$holydays = ("Uskrs", "Uznesenje", "Duhovi", "Presveto Trojstvo", "Tjelovo")

function calculate_easter {
 [outputType([datetime])]
 param ([int]$year)

 $a = $year % 19
 $b = [Math]::floor($year / 100)
 $c = $year % 100
 $d = [Math]::floor($b / 4)
 $e = $b % 4
 $f = [Math]::floor(($b+8)/25)
 $g = [Math]::floor(($b - $f + 1) / 3)
 $h = ((19 * $a + $b - $d - $g) + 15) % 30
 $i = [Math]::floor($c / 4)
 $k = $c % 4
 $l = (32 + 2 * $e + 2 * $i - $h - $k) % 7
 $m = [Math]::floor(($a + 11 * $h + 22 * $l) / 451)
 $numerator = $h + $l - 7 * $m + 114
 $month = [Math]::floor( $numerator / 31)
 $day = ($numerator % 31) + 1


 return get-date -year $year -Month $month -Day $day
}

function output_holidays {
 param ([int]$year)
 $l_easter = calculate_easter($year)
 $l_ascension = $l_easter.AddDays($ascension_offset)
 $l_pentecost = $l_easter.AddDays($pentecost_offset)
 $l_trinity = $l_easter.AddDays($trinity_offset)
 $l_corpus = $l_easter.AddDays($corpus_offset)
 $l_out_str =
      "$($holydays[0]): $($l_easter.tostring("ddd d MMM")); " + 
      "$($holydays[1]): $($l_ascension.tostring("ddd d MMM")); " +
      "$($holydays[2]): $($l_pentecost.tostring("ddd d MMM")); " +
      "$($holydays[3]): $($l_trinity.tostring("ddd d MMM")); " +
      "$($holydays[4]): $($l_corpus.tostring("ddd d MMM")); " 
 echo "$year : $l_out_str"
}

for ( $year = 400; $year -le 2100; $year += 100) {
  output_holidays $year
}
echo " "
for ( $year = 2010; $year -le 2020; $year += 1) {
  output_holidays $year
}
