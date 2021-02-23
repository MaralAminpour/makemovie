#!/bin/bash
cd forces
num=0
#for i in force_"%1d"*.png
nlines=`wc -l ../smooth.dat | awk '{ print $1 }'`
nframes=`echo "$nlines/400" | bc`
echo $nframes
for (( i = 0; i <= $nframes; ++i )); do
echo $i
  f=force_$i.png
  a=`printf "%05d" $num`
#  echo $a
  mv "$f" "force_$a.png"
  let "num = $(($num + 1))"
done
cd ..

